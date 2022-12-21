
import 'package:flutter/material.dart';

import '../card/message_card.dart';
import '../model.dart';

class MessagePanel extends StatefulWidget {
  const MessagePanel({Key? key}) : super(key: key);

  @override
  State<MessagePanel> createState() => _MessagePanelState();
}

class _MessagePanelState extends State<MessagePanel> {
  final MessageBox messageBox = MessageBox();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: messageBox.messageList.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 40,
          child: MessageCard(
              message: messageBox.messageList[index]!,
          ),
        );
      },
    );
  }
}
