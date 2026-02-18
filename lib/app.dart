import 'package:flutter/material.dart';
import 'views/home.dart';

class HabiticaApp extends StatelessWidget {
  const HabiticaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HabiticaHome(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
    );
  }
}
