import 'package:flutter/material.dart';
import 'pages/home_page/home_page.dart'; // importe sua nova página

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), 
    );
  }
}