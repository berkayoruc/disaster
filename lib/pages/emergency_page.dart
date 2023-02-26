import 'package:disaster/widgets/victim_button.dart';
import 'package:flutter/material.dart';

import '../widgets/tool_row/tool_row.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            ToolRow(),
            SizedBox(
              height: 40,
            ),
            VictimButton(
              height: 120,
            ),
            SizedBox(
              height: 28,
            ),
            VictimButton(
              iAmSafe: true,
              backgroundColor: Color(0xFF15BE6C),
            )
          ],
        ),
      ),
    );
  }
}
