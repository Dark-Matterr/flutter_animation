import 'package:flutter/material.dart';
import 'package:flutter_animations/routes/loginScreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:
            GoogleFonts.openSansTextTheme().apply(bodyColor: Colors.white),
      ),
      home: LoginScreen(),
    );
  }
}
