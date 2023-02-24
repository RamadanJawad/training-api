import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon});

  final TextEditingController controller;
  final String hintText;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.grey,
      style: GoogleFonts.cairo(fontSize: 18),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          hintText: hintText,
          hintStyle: GoogleFonts.cairo(fontSize: 18),
          prefixIcon: icon,
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          errorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          focusedErrorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
