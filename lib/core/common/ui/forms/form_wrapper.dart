import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';

class FormWrapper extends StatelessWidget {
  const FormWrapper({
    required this.form,
    super.key,
  });

  final Widget form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundSecondary,
      body: SizedBox.expand(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                top: AppLayout.p6,
                bottom: AppLayout.bottomBuffer,
              ),
              clipBehavior: Clip.none,
              child: Column(
                children: [
                  form,
                  const SizedBox(
                    height: AppLayout.bottomBuffer,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
