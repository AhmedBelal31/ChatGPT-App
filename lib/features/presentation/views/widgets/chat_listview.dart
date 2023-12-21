import 'package:chatgpt/features/presentation/controller/cubit/cubit.dart';
import 'package:chatgpt/features/presentation/views/widgets/chat_messages.dart';
import 'package:chatgpt/features/presentation/views/widgets/user_messages.dart';
import 'package:flutter/material.dart';

class ChatListView extends StatelessWidget {
  ChatListView({
    super.key,
    required this.scrollController,
    required this.textFormFieldValues,
  });

  ScrollController scrollController;
  final List textFormFieldValues;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if (index < textFormFieldValues.length) {
            return Column(
              children: [
                UserMessages(userMessage: textFormFieldValues[index]),
                if (index < AppCubit.get(context).responseMessage.length)
                  ChatMessages(
                      chatMessage: AppCubit.get(context).responseMessage[index],
                      scrollController: scrollController),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
        itemCount: textFormFieldValues.length,
      ),
    );
  }
}
