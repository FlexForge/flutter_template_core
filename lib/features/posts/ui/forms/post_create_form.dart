import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/core/common/ui/components/large_button.dart';
import 'package:flutter_template_core/core/common/ui/forms/flex_text_field.dart';
import 'package:flutter_template_core/core/common/ui/forms/form_wrapper.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';
import 'package:flutter_template_core/features/posts/controllers/post_create_controller.dart';
import 'package:flutter_template_core/features/posts/controllers/post_form_controller.dart';
import 'package:flutter_template_core/features/posts/controllers/post_list_controller.dart';
import 'package:flutter_template_core/features/posts/data/models/post_form_model.dart';
import 'package:flutter_template_core/features/posts/data/models/post_model.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class PostCreateForm extends ConsumerWidget {
  const PostCreateForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(postFormControllerProvider);

    ref.listen<PostModel?>(
      postCreateControllerProvider,
      (previous, next) {
        if (next == null) return;

        ref.read(postListControllerProvider.notifier).addPost(next);
        context.pop();
      },
    );

    return ReactivePostForm(
      form: form,
      child: FormWrapper(
        actionButtons: [
          ReactivePostFormConsumer(
            builder: (context, form, child) {
              return Expanded(
                child: LargeButton(
                  enabled: form.currentForm.valid,
                  onPressed: () =>
                      ref.read(postFormControllerProvider.notifier).create(),
                  label: 'Create Post',
                  backgroundColor: context.colors.foregroundPrimary,
                  foregroundColor: context.colors.backgroundPrimary,
                ),
              );
            },
          ),
        ],
        form: Column(
          children: [
            FlexTextField<String>(
              padding: const EdgeInsets.symmetric(horizontal: AppLayout.p4),
              label: 'Title',
              formControl: form.nameControl,
              hintText: 'Enter the title of the post',
              isRequired: true,
              validationMessages: {
                ValidationMessage.required: (error) =>
                    'The post title is required',
              },
            ),
            const SizedBox(height: AppLayout.p4),
            FlexTextField<String>(
              padding: const EdgeInsets.symmetric(horizontal: AppLayout.p4),
              label: 'Author',
              formControl: form.authorControl,
              hintText: 'Enter the author of the post',
              isRequired: true,
              inputCapitalization: TextCapitalization.words,
              validationMessages: {
                ValidationMessage.required: (error) =>
                    'The authors name is required',
              },
            ),
            const SizedBox(height: AppLayout.p4),
            FlexTextField<String>(
              padding: const EdgeInsets.symmetric(horizontal: AppLayout.p4),
              label: 'Body',
              formControl: form.bodyControl,
              inputType: TextInputType.multiline,
              inputAction: TextInputAction.newline,
              isTextArea: true,
              maxCharacters: 1500,
              validationMessages: {
                ValidationMessage.maxLength: (error) =>
                    "The body can't exceed 1500 characters",
              },
            ),
          ],
        ),
      ),
    );
  }
}
