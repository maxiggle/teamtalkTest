import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teamtalk/features/messages/messages.dart';
import 'package:teamtalk/features/settings/widgets/disconnect_button.dart';
import 'package:teamtalk/features/settings/widgets/personal_info_widget.dart';
import 'package:teamtalk/features/settings/widgets/task_and_point.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.inter(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 24,
            ),
            Container(
              width: 400.0,
              height: 123.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              child: Column(
                children: const [
                  SizedBox(
                    height: 16.0,
                  ),
                  Image(image: AssetImage('assets/images/avatar.png')),
                  SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text('Samuel Joseph'),
                  SizedBox(
                    height: 16.0,
                  )
                ],
              ),
            ),
            const SizedBox(height: 33.5),
            Row(
              children: [
                const Image(
                    image: AssetImage('assets/images/personal-avatar.png')),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Personal Info',
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 9.5,
                ),
              ],
            ),
            const SizedBox(
              child: PersonalinfoComponent(),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Row(
              children: [
                const Image(
                    image: AssetImage('assets/images/taskandpoint.png')),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Task and Points',
                  style: GoogleFonts.inter(
                      fontSize: 14.0, fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const TaskandPoint(),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: const [
                Text('Tags'),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Tags(),
            const SizedBox(
              height: 56,
            ),
            const Disconnectbutton(),
            const SizedBox(
              height: 47.5,
            )
          ],
        ),
      ),
    );
  }
}

class Tags extends StatelessWidget {
  Tags({super.key});

  final List<String> _tags = [
    'Tag One',
    'Tag One',
    'Tag One',
    'Tag One',
    'Tag One',
    'Tag One',
    'Tag One',
    'Tag One',
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: _tags.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 14,
        mainAxisExtent: 30,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff1D86E6)),
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),
          child: Center(
              child: Text(
            _tags[index],
            style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: const Color(0xff1D86E6)),
          )),
        );
      },
    );
  }
}

// int _selectedIndex = 0;

class IconBottomBar extends StatefulWidget {
  IconBottomBar(
      {super.key,
      required this.text,
      required this.image,
      required this.selected,
      required this.onPressed});
  final String text;
  final Widget image;
  final bool selected;
  final Function() onPressed;

  @override
  State<IconBottomBar> createState() => _IconBottomBarState();
}

class _IconBottomBarState extends State<IconBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 18.5,
        ),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: widget.onPressed,
          icon: widget.image,
          // color: Colors.red,
        ),
        const SizedBox(
          width: 55.17,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          widget.text,
          style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: widget.selected ? Colors.blue : null),
        ),
      ],
    );
  }
}
