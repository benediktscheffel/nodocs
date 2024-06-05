import 'package:flutter/material.dart';
import 'package:nodocs/widgets/navigation_button.dart';

import '../../feature_scan/widgets/scan_title_input.dart';
import '../../widgets/navigation_box.dart';

class WidgetsInputTitlePage extends StatelessWidget {
  const WidgetsInputTitlePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const ScanTitleInput(),
        centerTitle: true,
      ),
      body: null,
      bottomNavigationBar: NavigationBox(
        buttons: <Widget>[
          NavigationButton(
            buttonText: 'Home',
            buttonIcon: Icons.home_outlined,
            onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/'))
          ),
        ],
      ),
    );
  }
}