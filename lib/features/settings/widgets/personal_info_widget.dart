import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalinfoComponent extends StatelessWidget {
  const PersonalinfoComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
      color: const Color(0xffE8F3FC),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          InfoCard(
            title: 'EmailAddress',
            value: 'godwinG@gmail.com',
          ),
          Divider(),
          InfoCard(
            title: 'PhoneNumber',
            value: '08012345678',
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    this.title,
    this.value,
  }) : super(key: key);
  final String? title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? '' ':',
            style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xff696969)),
          ),
          Text(
            value ?? '',
            style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
