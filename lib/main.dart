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
        backgroundColor: Color(0xFFFEF9ED),
        appBar: AppBar(
          backgroundColor: const Color(0xFFEEE0BA),
          iconTheme: IconThemeData(color: Color(0xFF202118)),
          toolbarHeight: 80,
          elevation: 0,
          leading: Icon(Icons.menu),
          centerTitle: true,
          title: Text(
            'Armazem do Sítio',
            style: TextStyle(
              color: Color(0xFF202118),
              fontSize: 30,
            ),
          ),
        ),
        body: Column(
          children: [
            // Container(
            //   height: 200,
            //   width: 698,
            //   color: Colors.green,
            // ),
          ],
        ),
      ),
    );
  }
}
