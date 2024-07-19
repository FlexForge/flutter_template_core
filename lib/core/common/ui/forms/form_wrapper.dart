import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';

class FormWrapper extends StatelessWidget {
  const FormWrapper({
    required this.form,
    this.actionButton,
    super.key,
  });

  final Widget form;
  final Widget? actionButton;

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
            if (actionButton != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppLayout.p4,
                      vertical: AppLayout.p2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [actionButton!],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
