import 'package:chatgpt/core/utils/constants/constants.dart';
import 'package:chatgpt/core/utils/constants/styles.dart';
import 'package:chatgpt/core/utils/services/assets_data.dart';
import 'package:flutter/material.dart';

class UserMessages extends StatelessWidget {
  const UserMessages({
    super.key,
    this.userMessage,
  });

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
