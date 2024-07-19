import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'showcase_form_model.gform.dart';
part 'showcase_form_model.freezed.dart';

const textAreaMaxLength = 50;

@Rf()
@freezed
class FormShowcase with _$FormShowcase {
  const factory FormShowcase({
    @RfControl(validators: [RequiredValidator()]) String? textField,
    @RfControl(validators: [MaxLengthValidator(textAreaMaxLength)])
    String? textArea,
  }) = _FormShowcase;
}
