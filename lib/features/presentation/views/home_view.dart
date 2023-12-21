import 'package:chatgpt/core/utils/constants/constants.dart';
import 'package:chatgpt/core/utils/constants/styles.dart';
import 'package:chatgpt/core/utils/services/assets_data.dart';
import 'package:chatgpt/features/presentation/controller/cubit/cubit.dart';
import 'package:chatgpt/features/presentation/controller/cubit/states.dart';
import 'package:chatgpt/features/presentation/views/widgets/chat_listview.dart';
import 'package:chatgpt/features/presentation/views/widgets/custom_dropdownbutton.dart';
import 'package:chatgpt/features/presentation/views/widgets/default_text_field.dart';
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
                  textFormFieldValues: textFormFieldValues,
                ),
                // buildCustomTextField(context),
                const SizedBox(height: 10),
              ],
            ),
          ),
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
