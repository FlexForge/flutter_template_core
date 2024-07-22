import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/core/config/objectbox.dart';
import 'package:flutter_template_core/core/config/providers.dart';
import 'package:flutter_template_core/flavors.dart';

late ObjectBox objectBox;

Future<ProviderContainer> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer(
    observers: [if (F.appFlavor == Flavor.dev) _Logger()],
  );

  objectBox = await ObjectBox.create();

  await initializeProviders(container);

  return container;
}

class _Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint(
      '''
      {
      "provider": "${provider.name ?? provider.runtimeType}",
      "newValue": "$newValue"
      }''',
    );
  }
}
