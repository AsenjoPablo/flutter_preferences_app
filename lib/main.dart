import 'package:flutter/material.dart';
import 'package:flutter_preferences_app/providers/theme_provider.dart';
import 'package:flutter_preferences_app/screens/screens.dart';
import 'package:flutter_preferences_app/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

// async for preferences loading
void main() async {
  // handle preference loading
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  // init app once preferences are loaded
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName: (_) => HomeScreen(),
        SettingsScreen.routerName: (_) => SettingsScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
