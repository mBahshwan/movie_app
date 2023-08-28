import 'package:flutter/material.dart';
import 'package:movie_app/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.black12),
        buttonTheme: const ButtonThemeData(buttonColor: Colors.amber),
        scaffoldBackgroundColor: const Color.fromARGB(255, 46, 44, 44),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
