import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    // Todo: let's stylize it at some point
    return Scaffold(
      body: Center(child: Text(message)),
    );
  }
}
