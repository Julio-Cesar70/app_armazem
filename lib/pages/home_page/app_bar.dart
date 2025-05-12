import 'package:flutter/material.dart';

AppBar buildCustomAppBar() {
  return AppBar(
    backgroundColor: const Color(0xFFEEE0BA),
    iconTheme: const IconThemeData(color: Color(0xFF202118)),
    toolbarHeight: 60, // Aumenta a altura da AppBar
    elevation: 0,
    centerTitle: true,
    title: Text(
      'Armazem do Sítio',
      style: TextStyle(color: Color(0xFF202118), fontSize: 30),
    ),
  );
}
