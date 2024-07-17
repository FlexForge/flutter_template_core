import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_core/app.dart';
import 'package:flutter_template_core/bootstrap.dart';
import 'package:flutter_template_core/flavors.dart';

Future<void> main() async {
  F.appFlavor = Flavor.prod;

  runApp(
    UncontrolledProviderScope(
      container: await bootstrap(),
      child: const MainApp(),
    ),
  );
}
