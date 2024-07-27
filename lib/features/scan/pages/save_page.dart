import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:nodocs/features/filesystem/widgets/collection_dropdown.dart';
import 'package:nodocs/features/scan/controller/implementation/save_provider.dart';
import 'package:nodocs/features/scan/controller/save_controller.dart';
import 'package:nodocs/features/scan/widgets/scan_action_button.dart';
import 'package:nodocs/features/scan/widgets/scan_action_button_container.dart';
import 'package:nodocs/features/scan/widgets/scan_camera.dart';
import 'package:nodocs/features/scan/widgets/scan_carousel.dart';
import 'package:nodocs/features/scan/widgets/scan_ocr_loading_dialog.dart';
import 'package:nodocs/features/scan/widgets/scan_title_input.dart';
import 'package:nodocs/features/tags/widgets/tag_dropdown.dart';
import 'package:nodocs/gen/locale_keys.g.dart';
import 'package:nodocs/providers/camera_provider.dart';
import 'package:nodocs/widgets/confirmation_dialog.dart';
import 'package:nodocs/widgets/dropdown_with_label.dart';
import 'package:nodocs/widgets/navigation_box.dart';
import 'package:nodocs/widgets/navigation_button.dart';
import 'package:nodocs/widgets/title_with_button.dart';
import 'package:pdf/widgets.dart' as pw;

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
    final bool landscape = MediaQuery.of(context).orientation ==
        Orientation.landscape;
    return FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder:
            (final BuildContext context, final AsyncSnapshot<void> snapshot) {
          if (!controller.getCameraState()) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: theme.colorScheme.primary,
                title: Semantics(
                  identifier: 'save_title_input',
                  child: ScanTitleInput(
                    initialTitle: controller.getTitle(),
                    onTitleChanged: (final String title) {
                      controller.setTitle(title);
                    },
                  ),
                ),
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
                          padding: EdgeInsets.only(
                            left: landscape ? 50 : 16,
                            right: landscape ? 50 : 16,
                          ),
                          child: DropdownWithLabel(
                            dropdown: TagDropdown(
                              tags: controller.getTags(),
                              onSelectionChange: (final String tag) {
                                controller.toggleTag(tag);
                              },
                            ),
                            label: LocaleKeys.save_tag_dropdown_label.tr(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: landscape ? 50 : 16,
                            right: landscape ? 50 : 16,
                          ),
                          child: DropdownWithLabel(
                            dropdown: CollectionDropdown(
                              initialDirectory: controller.getDirectory(),
                              onPathChanged: (final String dir) {
                                controller.setDirectory(dir);
                              },
                            ),
                            label:
                                LocaleKeys.save_collection_dropdown_label.tr(),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ScanCarousel(
                          imagePaths: controller.getImagePaths(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ScanActionButtonContainer(
                          buttons: <Widget>[
                            ScanActionButton(
                              buttonIcon: Icons.crop_free_outlined,
                              buttonText: LocaleKeys
                                  .save_action_buttons_crop_again
                                  .tr(),
                              onPressed: () async {
                                if (!mounted) return;
                                final XFile pickedImage =
                                    controller.getSelectedImageFile();
                                CroppedFile? croppedFile = await controller
                                    .cropImage(theme, pickedImage, context);
                                if (croppedFile != null) {
                                  controller.setEditedImage(croppedFile.path);
                                  setState(() {});
                                }
                              },
                            ),
                            ScanActionButton(
                              buttonIcon: Icons.flip_camera_ios_outlined,
                              buttonText:
                                  LocaleKeys.save_action_buttons_retake.tr(),
                              onPressed: () => showDialog<String>(
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
                                        header: LocaleKeys
                                            .save_retake_dialog_header
                                            .tr(),
                                        notificationText: LocaleKeys
                                            .save_retake_dialog_body
                                            .tr()),
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
                    buttonText: LocaleKeys.save_navigation_cancel.tr(),
                    buttonIcon: Icons.cancel_outlined,
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (final BuildContext context) =>
                          ConfirmationDialog(
                              onConfirm: () {
                                controller.goBackHome();
                              },
                              onCancel: () {
                                controller.goBack();
                              },
                              header: LocaleKeys.save_cancel_dialog_header.tr(),
                              notificationText:
                                  LocaleKeys.save_cancel_dialog_body.tr()),
                    ),
                  ),
                  Semantics(
                    identifier: 'save_document_button',
                    child: NavigationButton(
                        buttonText: LocaleKeys.save_navigation_save.tr(),
                        buttonIcon: Icons.save_outlined,
                        onPressed: () {
                          controller.createPDF().then((final pw.Document pdf) {
                            controller.savePDF(pdf.save()).then((final _) {
                              controller.goBackHome();
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
                        }),
                  ),
                  Semantics(
                    identifier: 'save_ocr_button',
                    child: NavigationButton(
                        buttonText: LocaleKeys.save_navigation_ocr_save.tr(),
                        buttonIcon: Icons.document_scanner_outlined,
                        onPressed: () {
                          controller.checkInternetConnection().then((final _) {
                            controller.handleDocumentOCR().then((final _) {
                              controller.goBackHome();
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
                        }),
                  ),
                ],
              ),
            );
          } else {
            final AsyncValue<List<CameraDescription>> cameraListAsyncValue =
                ref.watch(cameraProvider);
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: theme.colorScheme.primary,
                title: TitleWithButton(
                  title: 'Retake Photo',
                  icon: Icons.arrow_back_ios_new_outlined,
                  onButtonClick: () {
                    setState(() {
                      controller.toggleCamera();
                      SystemChrome.setPreferredOrientations(
                          <DeviceOrientation>[]);
                    });
                  },
                ),
                centerTitle: true,
              ),
              body: cameraListAsyncValue.when(
                data: (final List<CameraDescription> cameras) {
                  if (cameras.isEmpty) {
                    return const Center(child: Text('No camera found'));
                  }
                  SystemChrome.setPreferredOrientations(
                      <DeviceOrientation>[DeviceOrientation.portraitUp]);
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
                    onOrientationAngleChanged: (final double value) {},
                    latestImagePath: controller.getLatestImagePath(),
                  );
                },
                loading: () => Center(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onPrimary,
                )),
                error: (final Object err, final StackTrace stack) =>
                    Center(child: Text('Error: $err')),
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
          header: LocaleKeys.save_error_dialogs_save_header.tr(),
          notificationText:
              LocaleKeys.save_error_dialogs_save_notification_text.tr(),
          cancelText: "",
          confirmText: LocaleKeys.save_error_dialogs_save_confirm.tr(),
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
          onCancel: () {},
          header: LocaleKeys.save_error_dialogs_ocr_header.tr(),
          notificationText:
              LocaleKeys.save_error_dialogs_ocr_notification_text.tr(),
          cancelText: "",
          confirmText: LocaleKeys.save_error_dialogs_ocr_confirm.tr(),
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
          onCancel: () {},
          header: LocaleKeys.save_error_dialogs_internet_header.tr(),
          notificationText:
              LocaleKeys.save_error_dialogs_internet_notification_text.tr(),
          cancelText: "",
          confirmText: LocaleKeys.save_error_dialogs_internet_confirm.tr(),
        );
      },
    );
  }
}
