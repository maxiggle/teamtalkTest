import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teamtalk/features/settings/view/settings_page.dart';
import 'widgets/app_bar_point_cards.dart';
import 'widgets/customappbar.dart';

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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Messages()));
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
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
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
              bottomNavigationBar: isKeyboardOpen ? null : teamTalkNavBottomNav,
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
                    child: ListView.builder(
                      itemCount: messages.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 0, bottom: 12),
                          margin: messages[index].messageType == "receiver"
                              ? const EdgeInsets.only(
                                  right: 40,
                                )
                              : const EdgeInsets.only(
                                  left: 40,
                                ),
                          child: Align(
                            alignment:
                                (messages[index].messageType == "receiver"
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
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    messages[index].messageContent,
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const TextBar()
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

class TextBar extends StatelessWidget {
  const TextBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffDBE0EB)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 3),
                    color: Color(0xff636F8829),
                    blurRadius: 4)
              ],
            ),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 18,
                  ),
                  backgroundColor: Colors.blue,
                  elevation: 0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
