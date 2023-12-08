import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/constants/styles.dart';
import 'package:chatgpt/services/assets_data.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages(
      {super.key, required this.chatIndex, required this.message});

  final int chatIndex;

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          padding: chatIndex == 0
              ? EdgeInsets.zero
              : const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            crossAxisAlignment:  chatIndex == 0 ? CrossAxisAlignment.center: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              Image.asset(
                chatIndex == 0 ? AssetsData.person : AssetsData.chatLogo,
                width: 30,
                height: 50,
              ),
              const SizedBox(width: 5),
              Expanded(
                  child: Text(
                message,
                style: Styles.textStyle16.copyWith(
                  height: 1.5,
                  letterSpacing: 1.1,
                ),
              )),
              if (chatIndex == 1) ...[
                const SizedBox(width: 5),
                const Icon(Icons.thumb_up_alt_outlined),
                const SizedBox(width: 5),
                const Icon(Icons.thumb_down_alt),
                const SizedBox(width: 5),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
