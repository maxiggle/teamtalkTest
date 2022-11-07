import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PointsCard extends StatelessWidget {
  const PointsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffC3DFF8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          children: [
            const Image(
              image: AssetImage('assets/images/coins.png'),
            ),
            const SizedBox(
              width: 4.26,
            ),
            Text(
              '18,900',
              style:
                  GoogleFonts.nunito(fontSize: 11, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              'points',
              style:
                  GoogleFonts.nunito(fontSize: 9, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
