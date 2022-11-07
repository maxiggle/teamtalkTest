import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teamtalk/features/messages/widgets/textbar.dart';
import 'package:teamtalk/features/settings/view/settings_page.dart';
import 'widgets/app_bar_point_cards.dart';
import 'widgets/customappbar.dart';
import 'widgets/sender_and_reciever.dart';

int _selectedIndex = 0;

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0.0;

    List<ChatMessage> messages = [
      ChatMessage(
          messageContent:
              "Lorem ipsum dolor sit amet.'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet.",
          messageType: "receiver"),
      ChatMessage(
          messageContent:
              "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. ",
          messageType: "receiver"),
      ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
      ChatMessage(
          messageContent:
              "Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor",
          messageType: "sender"),
      ChatMessage(
          messageContent:
              "Lorem ipsum dolor sit amet.'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet.",
          messageType: "receiver"),
      ChatMessage(
          messageContent:
              "Lorem ipsum dolor sit amet.'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet.",
          messageType: "receiver"),
      ChatMessage(
          messageContent:
              "Lorem ipsum dolor sit amet.'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet.",
          messageType: "receiver"),
    ];
    final teamTalkNavBottomNav = BottomAppBar(
      child: SizedBox(
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31.83),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                image: Image(
                    image: const AssetImage('assets/images/message.png'),
                    color: _selectedIndex == 0 ? Colors.blue : null),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                selected: _selectedIndex == 0,
                text: 'Messages',
              ),
              IconBottomBar(
                image: Image(
                    image: const AssetImage('assets/images/content.png'),
                    color: _selectedIndex == 1 ? Colors.blue : null),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                selected: _selectedIndex == 1,
                text: 'Content',
              ),
              IconBottomBar(
                image: Image(
                    image: const AssetImage(
                      'assets/images/message.png',
                    ),
                    color: _selectedIndex == 2 ? Colors.blue : null),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                selected: _selectedIndex == 2,
                text: 'Tasks',
              )
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      bottomNavigationBar: isKeyboardOpen ? null : teamTalkNavBottomNav,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          MessagesWidget(messages: messages),
          const Center(
            child: Text('Content'),
          ),
          const SettingsPage(),
        ],
      ),
    );
  }
}

class MessagesWidget extends StatelessWidget {
  const MessagesWidget({
    Key? key,
    required this.messages,
  }) : super(key: key);

  final List<ChatMessage> messages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xff1881DC),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 36.0, 0, 12),
                      child: Image(
                        image: AssetImage('assets/images/brandlogo.png'),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: PointsCard(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(85, 33.5, 0, 0),
                  child: Text(
                    'Hello, Samuel',
                    style: GoogleFonts.nunito(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 33.5, 0, 0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/users.png'),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Scaffold(
            // resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
              preferredSize: const Size.fromHeight(48),
              color: const Color(0xff636F88),
              custombackButton: const Image(
                image: AssetImage('assets/images/backbutton.png'),
              ),
              userImage: 'assets/images/johngreen.png',
              userName: 'John Green',
              userDescription: 'Brand Manager',
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'This is the message subject',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: SenderAndReceiver(messages: messages),
                ),
                const TextBar(),
                const SizedBox(
                  height: 21,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}
