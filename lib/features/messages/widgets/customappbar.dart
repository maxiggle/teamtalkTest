import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    this.color,
    this.height,
    required this.userImage,
    this.text,
    required this.preferredSize,
    this.custombackButton,
    this.userDescription,
    this.userName,
  });
  final Color? color;
  final Widget? text;
  final double? height;
  @override
  final Size preferredSize;
  final String userImage;
  final Widget? custombackButton;
  final String? userName;
  final String? userDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 4,
            color: Color(0xff636F8829),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            height: height,
            padding: const EdgeInsets.fromLTRB(7.5, 3.54, 7.5, 3.54),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: color),
            child: custombackButton,
          ),
          const SizedBox(
            width: 16,
          ),
          Image(
            image: AssetImage(userImage),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  '$userName',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 13, fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                '$userDescription',
                style: GoogleFonts.nunitoSans(
                    fontSize: 9, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ],
      ),
    );
  }
}
