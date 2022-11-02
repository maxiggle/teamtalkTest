import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Disconnectbutton extends StatelessWidget {
  const Disconnectbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(backgroundColor: Color(0xffFCE3E5)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(130, 13, 130, 13),
        child: Text(
          'Disconnect',
          style: GoogleFonts.inter(color: const Color(0xffE61D2A)),
        ),
      ),
    );
  }
}
