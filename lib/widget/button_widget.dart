import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(50.0),
        primary: Color.fromARGB(255, 94, 1, 66),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.robotoCondensed(
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      onPressed: onClicked,
    );
  }
}
