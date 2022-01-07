import 'package:flutter/material.dart';
import 'package:flutter_preferences_app/providers/theme_provider.dart';
import 'package:flutter_preferences_app/shared_preferences/preferences.dart';
import 'package:flutter_preferences_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ajustes',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                ),
                const Divider(),
                SwitchListTile.adaptive(
                  value: Preferences.isDarkMode,
                  onChanged: (value) {
                    Preferences.isDarkMode = value;
                    final themeProvider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    value
                        ? themeProvider.setDarkMode()
                        : themeProvider.setLightMode();
                    setState(() {});
                  },
                  title: const Text('Modo oscuro'),
                ),
                const Divider(),
                RadioListTile<int>(
                    value: 1,
                    groupValue: Preferences.gender,
                    onChanged: (value) {
                      Preferences.gender = value ?? 1;
                      setState(() {});
                    },
                    title: const Text('Masculino')),
                RadioListTile<int>(
                    value: 2,
                    groupValue: Preferences.gender,
                    onChanged: (value) {
                      Preferences.gender = value ?? 2;
                      setState(() {});
                    },
                    title: const Text('Femenino')),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextFormField(
                    onChanged: (value) {
                      Preferences.name = value;
                      setState(() {});
                    },
                    initialValue: Preferences.name,
                    decoration: const InputDecoration(
                        labelText: 'Nombre', helperText: 'Nombre del usuario'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
