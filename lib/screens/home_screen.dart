import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/constants/styles.dart';
import 'package:chatgpt/cubit/cubit.dart';
import 'package:chatgpt/cubit/states.dart';
import 'package:chatgpt/services/assets_data.dart';
import 'package:chatgpt/services/get_models_services.dart';
import 'package:chatgpt/widgets/chat_messages.dart';
import 'package:chatgpt/widgets/custom_dropdownbutton.dart';
import 'package:chatgpt/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// const HomeScreen({super.key});
  bool isTyping = false;
  TextEditingController textFormFieldController = TextEditingController();
  List textFormFieldValues = [];

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenWith = MediaQuery.of(context).size.width;
    return Builder(
      builder: (context) {
        AppCubit.get(context).responseMessage;
        return BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: customAppBar(),
              body: Padding(
                padding: screenWith >= 1000
                    ? EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 4)
                    : EdgeInsets.zero,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        // itemBuilder: (context, index) {
                        //   return Column(
                        //     children: [
                        //       UserMessages(userMessage:textFormFieldValues[index] ,),
                        //       if(state is! GetResponseSuccessState)
                        //         const SpinKitThreeBounce(color: Colors.white,size: 20,),
                        //       if(state is GetResponseSuccessState)
                        //         ChatMessages(chatMessage: BlocProvider.of<AppCubit>(context).responseMessage[index],)
                        //     ],
                        //   );
                        // },

                        itemBuilder: (context, index) {
                          if (index < textFormFieldValues.length) {
                            return Column(
                              children: [
                                UserMessages(
                                    userMessage: textFormFieldValues[index]),
                                // if(isTyping ==true)
                                // const SpinKitThreeBounce(
                                //   color: Colors.white,
                                //   size: 20,
                                // ),
                                if (index <
                                    BlocProvider.of<AppCubit>(context)
                                        .responseMessage
                                        .length)
                                  ChatMessages(
                                      chatMessage:
                                          BlocProvider.of<AppCubit>(context)
                                              .responseMessage[index]),

                              ],
                            );
                          } else {
                            // Handle the case where index is out of bounds
                            return const SizedBox.shrink();
                          }
                        },
                        itemCount: textFormFieldValues.length,


                        // itemCount:  textFormFieldValues.length,
                      ),
                    ),

                    if (isTyping && textFormFieldController.text.isNotEmpty)
                      const SpinKitThreeBounce(
                        color: Colors.white,
                        size: 20,
                      ),

                    //const SpinKitThreeBounce(color: Colors.white,size: 20,),
                    const SizedBox(height: 10),
                    Material(
                      color: cardColor,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: textFormFieldController,
                                style: Styles.textStyle16,
                                onChanged: (value) {
                                  print(value);
                                  // setState(() {
                                  // value.isNotEmpty ? isTyping = true : false;
                                  //
                                  //
                                  // });
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      isTyping = true;
                                    });
                                  } else {
                                    setState(() {
                                      isTyping = false;
                                    });
                                  }
                                  print(isTyping);
                                },
                                onFieldSubmitted: (value) {
                                  textFormFieldController.text = value;
                                  textFormFieldValues
                                      .add(textFormFieldController.text);
                                  BlocProvider.of<AppCubit>(context)
                                      .getResponseMessage(
                                          textFormFieldController.text);
                                  textFormFieldController.clear();
                                  scrollController.animateTo(
                                      scrollController.position.maxScrollExtent,
                                      duration:
                                          const Duration(milliseconds: 800),
                                      curve: Curves.easeInOut);
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '  How Can I help you '),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  textFormFieldValues
                                      .add(textFormFieldController.text);
                                  BlocProvider.of<AppCubit>(context)
                                      .getResponseMessage(
                                          textFormFieldController.text);
                                  textFormFieldController.clear();
                                  scrollController.animateTo(
                                      scrollController.position.maxScrollExtent,
                                      duration: const Duration(
                                        milliseconds: 800,
                                      ),
                                      curve: Curves.easeInOut);
                                },
                                icon: const Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        );
      },
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
        centerTitle: MediaQuery.of(context).size.width >= 1000 ? true : false,
        title: const Text(
          'ChatGPT',
          style: Styles.textStyle20,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await showModalBottomSheet(
                    backgroundColor: scaffoldBackgroundColor,
                    context: context,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
                    builder: (context) => const Row(
                          children: [
                            SizedBox(width: 20),
                            Text(
                              'Chosen Model : ',
                              style: Styles.textStyle18,
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(18.0),
                                child: CustomDropdown(),
                              ),
                            )
                          ],
                        ));
              },
              icon: const Icon(Icons.more_vert_outlined))
        ],
      );
}
