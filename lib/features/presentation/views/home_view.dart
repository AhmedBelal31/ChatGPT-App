import 'package:chatgpt/core/utils/constants/constants.dart';
import 'package:chatgpt/core/utils/constants/styles.dart';
import 'package:chatgpt/core/utils/services/assets_data.dart';
import 'package:chatgpt/features/presentation/controller/cubit/cubit.dart';
import 'package:chatgpt/features/presentation/controller/cubit/states.dart';
import 'package:chatgpt/features/presentation/views/widgets/chat_listview.dart';
import 'package:chatgpt/features/presentation/views/widgets/custom_dropdownbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isTyping = false;
  TextEditingController textFormFieldController = TextEditingController();
  List textFormFieldValues = [];
  ScrollController scrollController = ScrollController();

  // double maxScrollExtent = 0 ;
// @override
//   void initState() {
//     scrollController.addListener(() {
//       maxScrollExtent = scrollController.position.maxScrollExtent ;
//       print(scrollController.position.maxScrollExtent);
//     });
//     super.initState();
//   }
  @override
  void dispose() {
    textFormFieldController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWith = MediaQuery.of(context).size.width;
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
                ChatListView(
                  scrollController: scrollController,
                  textFormFieldValues: textFormFieldValues,
                ),
                if (isTyping && textFormFieldController.text.isNotEmpty)
                  const SpinKitThreeBounce(color: Colors.white, size: 20),
                const SizedBox(height: 10),
                DefaultTextField(
                    scrollController: scrollController,
                    textFormFieldController: textFormFieldController,
                    isTyping: isTyping,
                    textFormFieldValues: textFormFieldValues),
                // buildCustomTextField(context),

                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  // Material buildCustomTextField(BuildContext context) {
  //   return Material(
  //     color: cardColor,
  //     child: Padding(
  //       padding: const EdgeInsets.all(6.0),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Expanded(
  //             child: TextFormField(
  //               controller: textFormFieldController,
  //               style: Styles.textStyle16,
  //               onChanged: (value) {
  //                 if (value.isNotEmpty) {
  //                   setState(() {
  //                     isTyping = true;
  //                   });
  //                 } else {
  //                   setState(() {
  //                     isTyping = false;
  //                   });
  //                 }
  //               },
  //               onFieldSubmitted: (value) {
  //                 textFormFieldController.text = value;
  //                 buildSendMessageButton(context);
  //               },
  //               decoration: const InputDecoration(
  //                   border: InputBorder.none,
  //                   hintText: '  How Can I help you '),
  //             ),
  //           ),
  //           IconButton(
  //               onPressed: () {
  //                 buildSendMessageButton(context);
  //               },
  //               icon: const Icon(
  //                 Icons.send,
  //                 color: Colors.white,
  //               ))
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // void buildSendMessageButton(BuildContext context) {
  //   textFormFieldValues.add(textFormFieldController.text);
  //   AppCubit.get(context)
  //       .getResponseMessage(query: textFormFieldController.text);
  //   textFormFieldController.clear();
  //   scrollListToTheEnd();
  // }

  // void scrollListToTheEnd() {
  //   scrollController.animateTo(
  //     scrollController.position.maxScrollExtent,
  //     duration: const Duration(milliseconds: 800),
  //     curve: Curves.easeInOut,
  //   );
  // }

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
            onPressed: () {
              setState(() {
                textFormFieldValues = [];
                AppCubit.get(context).responseMessage = [];
              });
            },
            icon: const Icon(Icons.clear),
          ),
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

class DefaultTextField extends StatefulWidget {
  DefaultTextField(
      {super.key,
      required this.textFormFieldController,
      required this.isTyping,
      required this.scrollController,
      required this.textFormFieldValues});

  TextEditingController textFormFieldController;

  bool isTyping;

  List textFormFieldValues;
  ScrollController scrollController;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.textFormFieldController,
                style: Styles.textStyle16,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      widget.isTyping = true;
                    });
                  } else {
                    setState(() {
                      widget.isTyping = false;
                    });
                  }
                },
                onFieldSubmitted: (value) {
                  widget.textFormFieldController.text = value;
                  buildSendMessageButton(context);
                },
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '  How Can I help you '),
              ),
            ),
            IconButton(
                onPressed: () {
                  buildSendMessageButton(context);
                },
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }

  void buildSendMessageButton(BuildContext context) {
    widget.textFormFieldValues.add(widget.textFormFieldController.text);
    AppCubit.get(context)
        .getResponseMessage(query: widget.textFormFieldController.text);
    widget.textFormFieldController.clear();
    scrollListToTheEnd();
  }

  void scrollListToTheEnd() {
    widget.scrollController.animateTo(
      widget.scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }
}
