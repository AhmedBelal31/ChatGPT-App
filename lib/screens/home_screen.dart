import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/constants/styles.dart';
import 'package:chatgpt/services/api_service.dart';
import 'package:chatgpt/services/assets_data.dart';
import 'package:chatgpt/services/get_models_services.dart';
import 'package:chatgpt/widgets/chat_messages.dart';
import 'package:chatgpt/widgets/custom_dropdownbutton.dart';
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
      appBar:customAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          GetAllModels().getAllModel();

        },
      ),
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
          onPressed: () async
          {
            await showModalBottomSheet(
                backgroundColor: scaffoldBackgroundColor,
                context: context,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )
                ),
                builder: (context) => const Row(
                  children: [
                    SizedBox(width: 20),
                    Text('Chosen Model : ' ,style: Styles.textStyle18,) ,
                    SizedBox(width: 5),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(18.0),
                        child: CustomDropdown(),
                      ),
                    )
                  ],
                ));
          }, icon: const Icon(Icons.more_vert_outlined))
    ],
  );
}




