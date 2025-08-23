import 'package:flutter/material.dart';
import 'package:kingsman_mobileapp/features/auth/presentation/main_page.dart';
import 'package:kingsman_mobileapp/features/auth/presentation/registration_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Store',
      theme: ThemeData(
        primaryColor: Color(0xff282A51),
        scaffoldBackgroundColor: Colors.grey.shade300,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Colors.white,
          selectionHandleColor: Colors.white
        ),
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Color(0xff282A51)),
          labelStyle: TextStyle(color: Color(0xff282A51)),
          
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff282A51),
              width: 2
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 2
            )
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            iconColor: Colors.white,
            foregroundColor: Colors.white,
            backgroundColor: Color(0xff282A51),
            side: BorderSide(
              color: Color(0xff282A51),
              width: 2
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
          )
        ),
      ),
      home: MainPage(),
    );
  }
}
