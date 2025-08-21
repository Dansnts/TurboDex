import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'views/root_shell.dart'; // remplace par AuthGate si tu as un écran d'auth

/// Racine de l’app. Fournit MaterialApp, thèmes, routes, etc.
/// IMPORTANT : c’est ce widget qui apporte le `Directionality` requis par les Scaffold.
class TurboDexApp extends StatelessWidget {
  const TurboDexApp({super.key});

  @override
  Widget build(BuildContext context) {
    final light = buildTurboTheme(Brightness.light);
    final dark  = buildTurboTheme(Brightness.dark);

    return MaterialApp(
      title: 'TurboDex',
      debugShowCheckedModeBanner: false,
      theme: light,
      darkTheme: dark,
      themeMode: ThemeMode.system,
      // Si tu as une porte d’auth, remplace RootShell par AuthGate()
      home: const RootShell(),
    );
  }
}
