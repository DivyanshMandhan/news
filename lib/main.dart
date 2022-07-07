// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news/provider/theme_provider.dart';
import 'package:news/screens/home_screen.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDirectory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);

  final settings = await Hive.openBox('settings');
  bool isLightTheme = settings.get('isLightTheme') ?? false;
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(isLightTheme: isLightTheme),
      child: const AppStart(),
    ),
  );
}

class AppStart extends StatelessWidget {
  const AppStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MyApp(themeProvider: themeProvider);
  }
}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  final ThemeProvider themeProvider;
  MyApp({Key? key, required this.themeProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeProvider.themeData(),
      home: const HomeScreen(category: 'all'),
      debugShowCheckedModeBanner: false,
    );
  }
}
