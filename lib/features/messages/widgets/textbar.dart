import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBar extends StatelessWidget {
  const TextBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color(0xffDBE0EB), style: BorderStyle.solid),
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 3), color: Color(0xff636f8829), blurRadius: 4)
          ],
        ),
        child: TextField(
          maxLines: 4,
          minLines: 1,
          style: GoogleFonts.nunitoSans(
            fontSize: 15,
            color: const Color(0xff231F20),
          ),
          decoration: InputDecoration(
              suffixIcon: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.only(left: 6, right: 6),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(32)),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Send',
                      style: GoogleFonts.nunitoSans(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 4.8,
                    ),
                    const Image(
                        image: AssetImage('assets/images/sendbutton.png')),
                  ],
                ),
              ),
              hintText: "Type your reply here",
              hintStyle: TextStyle(color: Colors.black54),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
