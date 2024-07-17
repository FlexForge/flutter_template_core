import 'package:flutter_template_core/bootstrap.dart';
import 'package:flutter_template_core/db/objectbox.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
Store objectBoxStore(ObjectBoxStoreRef ref) {
  return objectBox.store;
}
