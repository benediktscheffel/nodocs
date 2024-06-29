import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:nodocs/features/filesystem/widgets/collection_dropdown.dart';
import 'package:nodocs/features/navigation/navigation_service_routes.dart';
import 'package:nodocs/features/scan/controller/implementation/save_provider.dart';
import 'package:nodocs/features/scan/controller/save_controller.dart';
import 'package:nodocs/features/scan/widgets/scan_action_button.dart';
import 'package:nodocs/features/scan/widgets/scan_action_button_container.dart';
import 'package:nodocs/features/scan/widgets/scan_camera.dart';
import 'package:nodocs/features/scan/widgets/scan_carousel.dart';
import 'package:nodocs/features/scan/widgets/scan_ocr_loading_dialog.dart';
import 'package:nodocs/features/scan/widgets/scan_title_input.dart';
import 'package:nodocs/features/tags/widgets/tag_dropdown.dart';
import 'package:nodocs/providers/camera_provider.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';
import 'package:nodocs/widgets/dropdown_with_label.dart';
import 'package:nodocs/widgets/navigation_box.dart';
import 'package:nodocs/widgets/navigation_button.dart';
import 'package:nodocs/widgets/title_with_button.dart';
import 'package:pdf/src/widgets/document.dart';

class SavePage extends ConsumerStatefulWidget {
  final List<String> imagePaths;
  const SavePage({super.key, required this.imagePaths});

  @override
  ConsumerState<SavePage> createState() => _SavePageState();
}

class _SavePageState extends ConsumerState<SavePage> {
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeController();
  }

  Future<void> _initializeController() async {
    final SaveController controller = ref.read(saveControllerProvider);
    controller.init(widget.imagePaths);
  }

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SaveController controller = ref.watch(saveControllerProvider);
    return FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (final BuildContext context, final AsyncSnapshot<void> snapshot)
      {
      if (!controller.getCameraState()) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: theme.colorScheme.primary,
            title: const ScanTitleInput(),
            centerTitle: true,
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: DropdownWithLabel(
                        dropdown: TagDropdown(
                          tags: controller.getTags(),
                        ),
                        label: "Select Tags",
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: DropdownWithLabel(
                        dropdown: CollectionDropdown(),
                        label: "Select Folder",
                      ),
                    ),
                    const SizedBox(height: 5,),
                    ScanCarousel(
                      imagePaths: controller.getImagePaths(),
                    ),
                    const SizedBox(height: 5,),
                    ScanActionButtonContainer(
                      buttons: <Widget>[
                        ScanActionButton(
                          buttonIcon: Icons.crop_free_outlined,
                          buttonText: 'Crop Again',
                          onPressed: () async {
                            if (!mounted) return;
                            final XFile pickedImage = controller.getSelectedImageFile();
                            CroppedFile? croppedFile = await controller.cropImage(theme, pickedImage, context);
                            if (croppedFile != null) {
                              controller.setEditedImage(croppedFile.path);
                              setState(() {});
                            }
                          },
                        ),
                        ScanActionButton(
                          buttonIcon: Icons.flip_camera_ios_outlined,
                          buttonText: 'Retake',
                          onPressed: () =>
                              showDialog<String>(
                                context: context,
                                builder: (final BuildContext context) =>
                                    ConfirmationDialog(
                                        onConfirm: () {
                                          controller.goBack();
                                          controller.toggleCamera();
                                          setState(() {});
                                        },
                                        onCancel: () {
                                          controller.goBack();
                                        },
                                        header: 'Retake this scan?',
                                        notificationText:
                                        'Are you sure you want to retake the scan of the current page without saving?'),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: NavigationBox(
            buttons: <Widget>[
              NavigationButton(
                buttonText: 'Cancel',
                buttonIcon: Icons.cancel_outlined,
                onPressed: () =>
                    showDialog<String>(
                      context: context,
                      builder: (final BuildContext context) =>
                          ConfirmationDialog(
                              onConfirm: () {
                                controller.goToPage(
                                    Uri(path: NavigationServiceRoutes.home));
                              },
                              onCancel: () {
                                controller.goBack();
                              },
                              header: 'Cancel this scan?',
                              notificationText:
                              'Are you sure you want to discard this scan without saving? This will discard all pages of this scan.'),
                    ),
              ),
              NavigationButton(
                  buttonText: 'Save',
                  buttonIcon: Icons.save_outlined,
                  onPressed: () {
                    // TODO Write Tags to Database and Save PDF in selected folder
                    controller.createPDF().then((final Document pdf) {
                      controller.savePDF(pdf.save()).then((final _) {
                        controller.goToPage(
                            Uri(path: NavigationServiceRoutes.home));
                      }).catchError((final _) {
                        showErrorDuringPdfSaveDialog(controller);
                      });
                    }).catchError((final _) {
                      showErrorDuringPdfSaveDialog(controller);
                    });
                    showDialog<String>(
                      context: context,
                      barrierDismissible: false,
                      builder: (final BuildContext context) {
                        return const ScanOcrLoadingDialog();
                      },
                    );
                  }
              ),
              NavigationButton(
                  buttonText: 'OCR & Save',
                  buttonIcon: Icons.document_scanner_outlined,
                  onPressed: () {
                    controller.checkInternetConnection().then((final _) {
                      controller.handleDocumentOCR().then((final _) {
                        controller.goToPage(
                            Uri(path: NavigationServiceRoutes.home));
                      }).catchError((final _) {
                        showErrorDuringOcrDialog(controller);
                      });
                    }).catchError((final _) {
                      showErrorInternetDialog(controller);
                    });
                    showDialog<String>(
                      context: context,
                      barrierDismissible: false,
                      builder: (final BuildContext context) {
                        return const ScanOcrLoadingDialog();
                      },
                    );
                  }
              ),
            ],
          ),
        );
      } else {
        final AsyncValue<List<CameraDescription>> cameraListAsyncValue = ref.watch(cameraProvider);
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: theme.colorScheme.primary,
            title: TitleWithButton(
              title: 'Retake Photo',
              icon: Icons.arrow_back_ios_new_outlined,
              onButtonClick: () {
                controller.toggleCamera();
                setState(() {});
              },
            ),
            centerTitle: true,
          ),
          body: cameraListAsyncValue.when(
            data: (final List<CameraDescription> cameras) {
              if (cameras.isEmpty) {
                return const Center(child: Text('No camera found'));
              }
              return ScanCamera(
                imagePaths: const <String>[],
                cameraList: cameras,
                onPhoto: (final XFile image) {
                  controller.setEditedImage(image.path);
                  controller.toggleCamera();
                  setState(() {});
                },
                onImageSelected: (final String path) {
                  controller.setEditedImage(path);
                  controller.toggleCamera();
                  setState(() {});
                },
                onLastImageTapped: () {},
              );
            },
            loading: () => Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onPrimary,
                )
            ),
            error: (final Object err, final StackTrace stack) => Center(child: Text('Error: $err')),
          ),
        );
      }
    });
  }

  void showErrorDuringPdfSaveDialog(final SaveController controller) {
    showDialog<String>(
      context: context,
      builder: (final _) {
        return ConfirmationDialog(
          onConfirm: () {
            controller.goBack();
            controller.goBack();
          },
          onCancel: () {},
          header: "Something went wrong!",
          notificationText: "Something went wrong during the save process.\nPlease try again!",
          cancelText: "",
          confirmText: "OK",
        );
      },
    );
  }

  void showErrorDuringOcrDialog(final SaveController controller) {
    showDialog<String>(
      context: context,
      builder: (final _) {
        return ConfirmationDialog(
          onConfirm: () {
            controller.goBack();
            controller.goBack();
          },
          onCancel: (){},
          header: "Something went wrong!",
          notificationText: "Something went wrong during the OCR process.\nPlease try again or save without OCR",
          cancelText: "",
          confirmText: "OK",
        );
      },
    );
  }

  void showErrorInternetDialog(final SaveController controller) {
    showDialog<String>(
      context: context,
      builder: (final _) {
        return ConfirmationDialog(
          onConfirm: () {
            controller.goBack();
            controller.goBack();
          },
          onCancel: (){},
          header: "Please check your internet connection!",
          notificationText: "An internet connection is required to process the document.",
          cancelText: "",
          confirmText: "OK",
        );
      },
    );
  }
}