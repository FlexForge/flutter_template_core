import 'package:flutter_template_core/features/user/data/db/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    DateTime? birthDate,
    String? userName,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) = _UserModel;
}

extension ConvertUserModel on UserModel {
  User toEntity() => User(
        firstName,
        lastName,
        email,
        id: id,
        userName: userName,
        birthDate: birthDate,
        updatedAt: updatedAt,
        createdAt: createdAt,
      );
}
