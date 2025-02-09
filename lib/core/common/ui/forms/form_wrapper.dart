import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';

class FormWrapper extends StatelessWidget {
  const FormWrapper({
    required this.form,
    this.actionButtons,
    this.backgroundColor,
    super.key,
  });

  final Widget form;
  final List<Widget>? actionButtons;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? context.colors.backgroundSecondary,
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
            if (actionButtons != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppLayout.p4,
                    vertical: AppLayout.p2,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0, 0.5],
                      colors: [
                        backgroundColor?.withOpacity(0) ??
                            context.colors.backgroundSecondary.withOpacity(0),
                        backgroundColor ?? context.colors.backgroundSecondary,
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: actionButtons!,
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
