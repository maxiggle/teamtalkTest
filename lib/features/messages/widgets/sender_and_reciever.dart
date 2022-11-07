import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teamtalk/features/messages/messages.dart';

class SenderAndReceiver extends StatelessWidget {
  const SenderAndReceiver({
    Key? key,
    required this.messages,
  }) : super(key: key);

  final List<ChatMessage> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 12),
          margin: messages[index].messageType == "receiver"
              ? const EdgeInsets.only(
                  right: 40,
                )
              : const EdgeInsets.only(
                  left: 40,
                ),
          child: Align(
            alignment: (messages[index].messageType == "receiver"
                ? Alignment.topLeft
                : Alignment.topRight),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: (messages[index].messageType == "sender"
                    ? Colors.grey.shade200
                    : const Color(0xffC3DFF8)),
              ),
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    messages[index].messageType == "receiver"
                        ? 'John Green'
                        : 'You',
                    style: GoogleFonts.nunitoSans(
                        fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    messages[index].messageContent,
                    style: GoogleFonts.nunitoSans(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(image: AssetImage('assets/images/chatbox.png')),
                          SizedBox(
                            width: 4.52,
                          ),
                          Text(
                            'Delivered',
                            style: GoogleFonts.nunitoSans(
                                fontSize: 9, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Text(
                        '22/10/22 5:15 PM',
                        style: GoogleFonts.nunitoSans(
                          fontSize: 11,
                        ),
                      ),
                      // Image(image: AssetImage('assets/images/timestop.png')),

                      // Text
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
