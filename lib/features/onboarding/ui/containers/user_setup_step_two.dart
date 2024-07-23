import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/core/common/ui/components/large_button.dart';
import 'package:flutter_template_core/core/common/ui/forms/flex_text_field.dart';
import 'package:flutter_template_core/core/common/ui/forms/form_wrapper.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';
import 'package:flutter_template_core/features/onboarding/controllers/onboarding_controller.dart';
import 'package:flutter_template_core/features/onboarding/controllers/user_form_controller.dart';
import 'package:flutter_template_core/features/onboarding/data/models/user_form_model.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class UserSetupFormStepTwo extends ConsumerWidget {
  const UserSetupFormStepTwo({
    required this.back,
    super.key,
  });

  final VoidCallback back;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(userFormControllerProvider);

    return ReactiveUserForm(
      form: form,
      child: FormWrapper(
        backgroundColor: context.colors.backgroundPrimary,
        actionButtons: [
          LargeButton(
            onPressed: back,
            icon: Icons.chevron_left,
            backgroundColor: context.colors.backgroundSecondary,
          ),
          const SizedBox(width: AppLayout.p3),
          ReactiveUserFormConsumer(
            builder: (context, form, child) => Expanded(
              child: LargeButton(
                enabled: form.emailControl?.valid ?? false,
                onPressed: () {
                  ref.read(userFormControllerProvider.notifier).create();
                  ref
                      .read(onboardingControllerProvider.notifier)
                      .setIsFirstLoad(isFirstLoad: false);
                },
                label: 'Go to app',
                icon: Icons.check,
                backgroundColor: context.colors.foregroundPrimary,
                foregroundColor: context.colors.backgroundPrimary,
              ),
            ),
          ),
        ],
        form: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppLayout.p4),
              child: Text(
                'And your email?',
                style: context.typography.titleMedium
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: AppLayout.p2),
            FlexTextField<String>(
              formControl: form.emailControl,
              hintText: 'Enter your email',
              isRequired: true,
              inputAction: TextInputAction.done,
              inputType: TextInputType.emailAddress,
              showErrors: (control) => control.invalid && control.dirty,
              validationMessages: {
                ValidationMessage.required: (error) => 'Your email is required',
                ValidationMessage.email: (error) => 'Must be a valid email',
              },
              padding: const EdgeInsets.symmetric(horizontal: AppLayout.p4),
            ),
          ],
        ),
      ),
    );
  }
}
