import 'package:bloc/bloc.dart';
import 'package:chatgpt/core/utils/constants/constants.dart';
import 'package:chatgpt/features/presentation/controller/cubit/bloc_observer.dart';
import 'package:chatgpt/features/presentation/controller/cubit/cubit.dart';
import 'package:chatgpt/features/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const ChatGPT());
}
/// TO Do :
//Add Arabic to Bot
// fix scroll to end of list
// fix responsive
// Connect To internet
class ChatGPT extends StatelessWidget {
  const ChatGPT({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        title: 'ChatGPT',
        theme: ThemeData.dark(
          useMaterial3: true,
        ).copyWith(
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          appBarTheme: AppBarTheme(
            color: cardColor,
          ),
          // textTheme:GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme) ,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}
