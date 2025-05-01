import 'package:flutter/material.dart';

AppBar buildCustomAppBar() {
  return AppBar(
    backgroundColor: const Color(0xFFEEE0BA),
    iconTheme: IconThemeData(color: Color(0xFF202118)),
    toolbarHeight: 60,
    elevation: 0,
    leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
    centerTitle: true,
    title: Text(
      'Armazem do Sítio',
      style: TextStyle(color: Color(0xFF202118), fontSize: 30),
    ),
  );
}
