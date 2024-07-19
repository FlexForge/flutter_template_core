import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'post_form_model.gform.dart';
part 'post_form_model.freezed.dart';

@Rf()
@freezed
class Post with _$Post {
  const factory Post({
    @RfControl(validators: [RequiredValidator()]) String? name,
    @RfControl(validators: [RequiredValidator()]) String? author,
    @RfControl(validators: [MaxLengthValidator(1500)]) String? body,
  }) = _Post;
}
