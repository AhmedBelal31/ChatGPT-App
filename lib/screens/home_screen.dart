import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/constants/styles.dart';
import 'package:chatgpt/services/assets_data.dart';
import 'package:chatgpt/widgets/chat_messages.dart';
import 'package:chatgpt/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// const HomeScreen({super.key});
  bool isTyping = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ChatMessages(
                  message: chatMessages[index]['msg'].toString(),
                  chatIndex:
                      int.parse(chatMessages[index]['chatIndex'].toString()),
                );
              },
              itemCount: chatMessages.length,
            ),
          ),

            if(isTyping)...[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SpinKitThreeBounce(color: Colors.white,size: 20,),
              ),

            ] ,

          // const SpinKitThreeBounce(color: Colors.white,size: 20,),

          const CustomTextField(),
        ],
      ),
    );
  }

  AppBar customAppBar() => AppBar(
    scrolledUnderElevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsData.openaiLogo,
          ),
        ),
        titleSpacing: 5.0,
        title: const Text(
          'ChatGPT',
          style: Styles.textStyle20,
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
        ],
      );
}




