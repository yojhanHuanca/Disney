import 'package:flutter/material.dart';

import '../screens/detail_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/splash_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const home = '/home';
  static const detail = '/detail';
  static const profile = '/profile';

  // Rutas nombradas del laboratorio; /detail recibe el mapa por arguments.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
      case home:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
      case detail:
        final content = settings.arguments;
        if (content is! Map<String, dynamic>) {
          return _errorRoute('No se recibió el contenido para el detalle.');
        }
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => DetailScreen(content: content),
        );
      case profile:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const ProfileScreen(),
        );
      default:
        return _errorRoute('Ruta no encontrada: ${settings.name}');
    }
  }

  static MaterialPageRoute<void> _errorRoute(String message) {
    return MaterialPageRoute<void>(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error de navegación')),
        body: Center(child: Text(message)),
      ),
    );
  }
}
