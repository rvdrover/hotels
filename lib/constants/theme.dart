import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    
    appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 0, 145, 148),
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        )),
       primaryColor: const Color.fromARGB(255, 0, 145, 148),
       
 elevatedButtonTheme: ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 145, 148)), 
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white,), 
  ),
),
    
  );
}
