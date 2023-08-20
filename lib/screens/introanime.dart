import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class introanime extends StatefulWidget {
  @override
  _introanimeState createState() => _introanimeState();
}

class _introanimeState extends State<introanime> {
  final String textToAnimate = 'Hey, Wolf'; // Replace with your desired text
  String displayedText = '';
  bool navi = false;

  @override
  void initState() {
    super.initState();
    _printLetters();
    Timer(const Duration(seconds: 3), () {
      navi = true;
      setState(() {});
      if (navi == true) {
        Timer(const Duration(seconds: 4), () {
          Navigator.pushReplacementNamed(context, '/home1');
        });
      }
    });
  }

  void _printLetters() async {
    for (int i = 0; i < textToAnimate.length; i++) {
      await Future.delayed(Duration(milliseconds: 250));
      setState(() {
        displayedText = textToAnimate.substring(0, i + 1);
      });
    }
    navi=true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(displayedText,
            style: GoogleFonts.getFont('VT323', textStyle: TextStyle(fontSize: 20, color: Colors.white))
          ),
        ),
      ),
    );
  }
}
