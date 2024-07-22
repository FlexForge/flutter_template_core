import 'package:flutter_template_core/features/user/data/models/user_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  User(
    this.firstName,
    this.lastName,
    this.email, {
    this.id = 0,
    this.userName,
    this.birthDate,
    this.updatedAt,
    this.createdAt,
  });

  @Id()
  int id = 0;

  String firstName;
  String lastName;
  String email;

  String? userName;
  @Property(type: PropertyType.date)
  DateTime? birthDate;

  @Property(type: PropertyType.date)
  DateTime? updatedAt;
  @Property(type: PropertyType.date)
  DateTime? createdAt;
}

extension ConvertUser on User {
  UserModel toModel() => UserModel(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        birthDate: birthDate,
        userName: userName,
        updatedAt: updatedAt,
        createdAt: createdAt,
      );
}
