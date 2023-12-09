import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/constants/styles.dart';
import 'package:chatgpt/services/assets_data.dart';
import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class UserMessages extends StatelessWidget {
  const UserMessages({super.key ,this.userMessage,});
  final String? userMessage;
  @override
  Widget build(BuildContext context) {
    double screenWith = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: scaffoldBackgroundColor,
        borderRadius: screenWith >= 1000
            ? BorderRadius.circular(20)
            .copyWith(topLeft: const Radius.circular(0))
            : BorderRadius.zero,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          Image.asset(
            AssetsData.person,
            width: 30,
            height: 50,
          ),
          const SizedBox(width: 5),
          Expanded(
              child: Text(
                userMessage ?? '',
                style: Styles.textStyle16.copyWith(
                  height: 1.5,
                  letterSpacing: 1.1,
                ),
              )),
        ],
      ),
    );
  }
}
class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key, this.chatMessage});

  final String? chatMessage;

  @override
  Widget build(BuildContext context) {
    double screenWith = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: screenWith >= 1000
              ? BorderRadius.circular(20)
                  .copyWith(topLeft: const Radius.circular(0))
              : BorderRadius.zero),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          Image.asset(
            AssetsData.chatLogo,
            width: 30,
            height: 50,
          ),
          const SizedBox(width: 5),
          Expanded(
          //     child: Text(
          //   chatMessage ?? '',
          //   style: Styles.textStyle16.copyWith(
          //     height: 1.5,
          //     letterSpacing: 1.1,
          //   ),
          // ),
            child: DefaultTextStyle(
              style: Styles.textStyle16.copyWith(
              letterSpacing: 1.1,
              height: 1.5,
            ),
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                stopPauseOnTap: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                      chatMessage ?? '',
                  ),


                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
          const SizedBox(width: 5),
          const Icon(Icons.thumb_up_alt_outlined),
          const SizedBox(width: 5),
          const Icon(Icons.thumb_down_alt),
          screenWith >= 1000
              ? const SizedBox(width: 20)
              : const SizedBox(width: 5),
        ],
      ),
    );
  }
}



// Container(
// padding: chatIndex == 0
// ? EdgeInsets.zero
//     : const EdgeInsets.symmetric(vertical: 20),
// decoration: BoxDecoration(
// color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
// borderRadius: screenWith >=1000 ? BorderRadius.circular(20).copyWith(
// topLeft:const Radius.circular(0)
// ) : BorderRadius.zero
// ),
// child: Row(
// crossAxisAlignment:  chatIndex == 0 ? CrossAxisAlignment.center: CrossAxisAlignment.start,
// children: [
// const SizedBox(width: 10),
// Image.asset(
// chatIndex == 0 ? AssetsData.person : AssetsData.chatLogo,
// width: 30,
// height: 50,
// ),
// const SizedBox(width: 5),
// Expanded(
// child: Text(
// message ??'',
// style: Styles.textStyle16.copyWith(
// height: 1.5,
// letterSpacing: 1.1,
// ),
// )),
// if (chatIndex == 1) ...[
// const SizedBox(width: 5),
// const Icon(Icons.thumb_up_alt_outlined),
// const SizedBox(width: 5),
// const Icon(Icons.thumb_down_alt),
// screenWith >=1000  ?const SizedBox(width:20) : const SizedBox(width: 5),
// ]
// ],
// ),
// ),
