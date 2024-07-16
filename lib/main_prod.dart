import 'package:flutter/material.dart';
import 'package:flutter_template_core/app.dart';
import 'package:flutter_template_core/flavors.dart';

void main() {
  F.appFlavor = Flavor.prod;

  runApp(const MainApp());
}
