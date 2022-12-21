
import 'package:flutter/material.dart';

import '../model.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({Key? key, required this.message}) : super(key: key);
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row( /*Place the Icon on the left side, and the text on the right side*/
      crossAxisAlignment: CrossAxisAlignment.start, /*Use CrossAxisAlignment.start for each row and column*/
      children: [
        message.icon,
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0), /*Apply padding (EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0) to the text part of textSection. */
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, /*Use CrossAxisAlignment.start for each row and column*/
            children: [
              Text(message.title, style: const TextStyle(fontWeight: FontWeight.bold)), /*Change the font weight of the Text('Recent Message') bold*/
              Text(message.contents),
            ],
          ),
        ),
      ],
    );
  }
}
