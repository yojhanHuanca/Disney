import 'package:flutter/material.dart';

import '../config/theme.dart';
import '../routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil', style: AppTheme.heading.copyWith(fontSize: 20)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 14, 18, 28),
        children: [
          const SizedBox(height: 18),
          const Center(
            child: CircleAvatar(
              radius: 46,
              backgroundColor: AppTheme.primary,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              'Alex',
              style: AppTheme.heading.copyWith(fontSize: 24),
            ),
          ),
          Center(
            child: Text(
              'Perfil estándar',
              style: AppTheme.body.copyWith(color: AppTheme.muted),
            ),
          ),
          const SizedBox(height: 28),
          // ListTile: opciones de cuenta y ajustes del perfil.
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.account_circle_outlined),
                  title: Text('Cuenta', style: AppTheme.body),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showMessage(context, 'Administración de cuenta'),
                ),
                const Divider(height: 1, indent: 56),
                ListTile(
                  leading: const Icon(Icons.settings_outlined),
                  title: Text('Ajustes', style: AppTheme.body),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showMessage(context, 'Ajustes de la aplicación'),
                ),
                const Divider(height: 1, indent: 56),
                SwitchListTile(
                  secondary: const Icon(Icons.dark_mode_outlined),
                  title: Text('Modo oscuro', style: AppTheme.body),
                  value: true,
                  onChanged: (_) => _showMessage(
                    context,
                    'La experiencia de este laboratorio usa tema oscuro.',
                  ),
                ),
                const Divider(height: 1, indent: 56),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: Text('Salir', style: AppTheme.body),
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.splash,
                    (_) => false,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'DISNEY+  ·  LABORATORIO ACADÉMICO',
            textAlign: TextAlign.center,
            style: AppTheme.label.copyWith(
              color: AppTheme.muted,
              fontSize: 11,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  static void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
