import 'package:flutter/material.dart';

import '../shared_preferences/preferences.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Darkmode activo: ${getDarkmodeLiteral(Preferences.isDarkMode)}'),
            Divider(),
            Text('Género: ${getGenderLiteral(Preferences.gender)}'),
            Divider(),
            Text('Nombre de usuario: ${Preferences.name}'),
            Divider(),
          ],
        ));
  }

  String getDarkmodeLiteral(bool value) {
    return value ? 'Sí' : 'No';
  }

  String getGenderLiteral(int value) {
    return value == 1 ? 'Masculino' : 'Femenino';
  }
}
