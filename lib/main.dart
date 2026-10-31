import 'package:flutter/material.dart';

import 'config/theme.dart';
import 'routes/app_routes.dart';

void main() => runApp(const DisneyPlusLabApp());

class DisneyPlusLabApp extends StatelessWidget {
  const DisneyPlusLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Tema global del laboratorio: paleta oscura y tres familias tipográficas.
    return MaterialApp(
      title: 'Disney+',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
