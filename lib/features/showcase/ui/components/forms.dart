import 'package:flutter_template_core/core/common/ui/components/section.dart';
import 'package:flutter_template_core/core/common/ui/forms/flex_text_field.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';
import 'package:flutter_template_core/features/showcase/data/models/showcase_form_model.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FormShowcase extends StatelessWidget {
  const FormShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      subHeader: 'Forms',
      padding: const EdgeInsets.symmetric(horizontal: AppLayout.p4),
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppLayout.p4,
          right: AppLayout.p4,
          top: AppLayout.p2,
          bottom: AppLayout.p4,
        ),
        child: FormShowcaseFormBuilder(
          builder: (context, formModel, child) {
            return Column(
              children: [
                FlexTextField(
                  formControl: formModel.textFieldControl,
                  label: 'Example Text Field',
                  hintText: 'Example hint text',
                  isRequired: true,
                  validationMessages: {
                    ValidationMessage.required: (_) =>
                        'The textField must not be empty',
                  },
                ),
                const SizedBox(height: AppLayout.p4),
                FlexTextField(
                  formControl: formModel.textAreaControl,
                  label: 'Example Text Area',
                  isTextArea: true,
                  maxCharacters: textAreaMaxLength,
                  validationMessages: {
                    ValidationMessage.maxLength: (_) =>
                        'The textField cannot exceed '
                        '$textAreaMaxLength characters',
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
