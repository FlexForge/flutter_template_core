import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/core/common/ui/components/large_button.dart';
import 'package:flutter_template_core/core/common/ui/forms/flex_radio_list.dart';
import 'package:flutter_template_core/core/common/ui/forms/form_wrapper.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';
import 'package:flutter_template_core/features/onboarding/controllers/user_form_controller.dart';
import 'package:flutter_template_core/features/onboarding/data/models/user_form_model.dart';

class UserSetupFormStepThree extends ConsumerWidget {
  const UserSetupFormStepThree({
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
                enabled: form.sexControl?.valid ?? false,
                // onPressed: () {
                //   ref.read(userFormControllerProvider.notifier).create();
                //   ref
                //       .read(onboardingControllerProvider.notifier)
                //       .setIsFirstLoad(isFirstLoad: false);
                // },
                onPressed: () => print(form.sexControl?.value),
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
                'What is your sex?',
                style: context.typography.titleMedium
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: AppLayout.p4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppLayout.p4),
              child: FlexRadioList(
                formControl: form.sexControl,
                options: const [
                  RadioListItem(name: 'Female', icon: Icons.female),
                  RadioListItem(name: 'Male', icon: Icons.male),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
