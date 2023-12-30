import 'package:flutter/material.dart';
import 'package:flutter_curd_with_api/features/home/ui/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.cyan,
        primaryColor: Colors.cyan,
        focusColor: Colors.cyan,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.cyan,),
      ),
      home: const HomeScreen(),
    );
  }
}