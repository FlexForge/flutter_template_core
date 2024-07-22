import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/bootstrap.dart';
import 'package:flutter_template_core/db/objectbox.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'providers.g.dart';

@riverpod
Store objectBoxStore(ObjectBoxStoreRef ref) {
  return objectBox.store;
}

@Riverpod(keepAlive: true)
FutureOr<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) {
  return SharedPreferences.getInstance();
}

Future<void> initializeProviders(ProviderContainer container) async {
  await container.read(sharedPreferencesProvider.future);
}
