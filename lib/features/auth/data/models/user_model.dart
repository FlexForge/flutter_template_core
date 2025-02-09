import 'package:flutter/material.dart';
import 'package:flutter_template_core/features/auth/data/db/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required bool isMale,
    required ThemeMode preferredTheme,
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
        isMale: isMale,
        userName: userName,
        birthDate: birthDate,
        preferredTheme: preferredTheme,
        updatedAt: updatedAt,
        createdAt: createdAt,
      );
}

extension FormatCreatedDate on UserModel {
  String formatCreatedDate() {
    if (createdAt == null) return '';

    return DateFormat.yMMMMd().format(createdAt!);
  }
}
