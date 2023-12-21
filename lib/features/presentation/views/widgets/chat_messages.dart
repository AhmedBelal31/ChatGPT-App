import 'package:chatgpt/core/utils/constants/constants.dart';
import 'package:chatgpt/core/utils/constants/styles.dart';
import 'package:chatgpt/core/utils/services/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clipboard/clipboard.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              Image.asset(AssetsData.chatLogo, width: 30, height: 50),
              const SizedBox(width: 5),
              buildAnimatedResponseText(),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 30),
              IconButton(
                icon: const Icon(
                  Icons.content_copy,
                  color: Colors.white,
                  size: 22,
                ),
                onPressed: () {
                  FlutterClipboard.copy(chatMessage ?? '');

                  // Show Toast

                  // FlutterClipboard.copy(chatMessage ??'').then((value)=>Fluttertoast.showToast(
                  //     msg:"Copied",
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.BOTTOM,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: Colors.red,
                  //     textColor: Colors.white,
                  //     fontSize: 16.0
                  // ));
                },
              ),
              const Icon(Icons.thumb_up_alt_outlined),
              const SizedBox(width: 10),
              const Icon(Icons.thumb_down_alt),
              screenWith >= 1000
                  ? const SizedBox(width: 20)
                  : const SizedBox(width: 5),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAnimatedResponseText() {
    return Expanded(
      child: DefaultTextStyle(
        style: Styles.textStyle16
            .copyWith(letterSpacing: 1.1, height: 1.5, color: Colors.white),
        child: AnimatedTextKit(
          totalRepeatCount: 1,
          stopPauseOnTap: true,
          animatedTexts: [TypewriterAnimatedText(chatMessage ?? '')],
          onTap: () {},
        ),
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
