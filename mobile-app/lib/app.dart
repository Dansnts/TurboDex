import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'views/root_shell.dart';

class TurboDexApp extends StatelessWidget {
  const TurboDexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TurboDex',
      debugShowCheckedModeBanner: false,
      theme: buildTurboTheme(Brightness.light),
      darkTheme: buildTurboTheme(Brightness.dark),
      home: const RootShell(),
    );
  }
}

