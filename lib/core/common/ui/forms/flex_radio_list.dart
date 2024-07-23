import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/common/ui/components/large_button.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/core/theme/app_layout.dart';
import 'package:fpdart/fpdart.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class RadioListItemClass {
  const RadioListItemClass({required this.name});
  final String name;
}

class RadioListItem extends StatelessWidget {
  const RadioListItem({
    required this.name,
    required this.icon,
    this.selected = false,
    this.onPressed,
    super.key,
  });

  final String name;
  final IconData icon;

  final bool selected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return LargeButton(
      onPressed: onPressed,
      borderColor:
          selected ? context.colors.foregroundPrimary : context.colors.divider,
      borderWidth: selected ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppLayout.p4,
          vertical: AppLayout.p6,
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: AppLayout.p3),
            Text(
              name,
              style: context.typography.bodyMedium
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class FlexRadioList extends ReactiveFormField<int, int> {
  FlexRadioList({
    required List<RadioListItem> options,
    super.key,
    super.formControlName,
    super.formControl,
    super.validationMessages,
    super.valueAccessor,
    super.showErrors,
  }) : super(
          builder: (field) {
            return IgnorePointer(
              ignoring: !field.control.enabled,
              child: Listener(
                onPointerDown: (_) => field.control.markAsTouched(),
                child: Column(
                  children: options
                      .mapWithIndex(
                        (e, index) => Column(
                          children: [
                            RadioListItem(
                              name: e.name,
                              icon: e.icon,
                              selected: field.value == index,
                              onPressed: () {
                                field.didChange(index);
                              },
                            ),
                            const SizedBox(height: AppLayout.p2),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          },
        );
}
