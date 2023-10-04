import 'package:flutter/material.dart';
import 'package:flutter_gpt/model/message.dart';

import '../../constants/app_consts.dart';

class BubbleChatWidget extends StatelessWidget {
  const BubbleChatWidget(
      {Key? key, required this.message,})
      : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: message.isUser ? AppConsts.kPrimaryColor : Colors.blueGrey,
          borderRadius: message.isUser
              ? const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
        ),
        child: Text(
          message.content,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
