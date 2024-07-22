import 'package:flutter/material.dart';
import 'package:flutter_template_core/core/utils/failure.dart';
import 'package:flutter_template_core/db/objectbox.g.dart' as ob;
import 'package:flutter_template_core/features/user/data/db/user_entity.dart';
import 'package:flutter_template_core/features/user/data/models/user_model.dart';
import 'package:fpdart/fpdart.dart';

class UserRepository {
  UserRepository({required this.store});

  final ob.Store store;

  ob.Box<User> get box => store.box<User>();

  Either<Failure, UserModel> getUser() {
    try {
      final res = box.getAll();

      if (res.isEmpty) {
        return left(const Failure.empty());
      }

      return right(res.first.toModel());
    } catch (e) {
      return left(Failure.internalServerError(message: e.toString()));
    }
  }

  Either<Failure, ThemeMode> updateTheme({
    required ThemeMode theme,
  }) {
    try {
      final res = box.getAll();

      if (res.isEmpty) {
        return left(const Failure.empty());
      }

      final user = res.first;

      box.put(
        user..dbPreferredTheme = theme.index,
        mode: ob.PutMode.update,
      );

      return right(theme);
    } catch (e) {
      return left(Failure.internalServerError(message: e.toString()));
    }
  }
}
