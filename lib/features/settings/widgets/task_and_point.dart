import 'package:flutter/material.dart';

import 'personal_info_widget.dart';

class TaskandPoint extends StatelessWidget {
  const TaskandPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
      color: const Color(0xffE8F3FC),
      child: Column(
        children: const [
          InfoCard(
            title: 'Tasks Completed',
            value: '50',
          ),
          Divider(),
          InfoCard(
            title: 'Accumulated Points\n(Worth)',
            value: '50,283',
          )
        ],
      ),
    );
  }
}
