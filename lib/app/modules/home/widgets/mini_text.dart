import 'package:bora_bebe/app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MiniText extends StatelessWidget {
  final String text;
  MiniText({this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.w700,
          color: titleColor.withOpacity(0.5),
          fontSize: 18,
        ));
  }
}
