import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFEEFDA),
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo_armazem.png',
            height: 100,
            width: 101,
            fit: BoxFit.contain,
          ),
          backgroundColor: const Color(0xFFFEEFDA),
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            color: Color(0xFFD9D9D9),
          ),
        ),
      ),
    );
  }
}
