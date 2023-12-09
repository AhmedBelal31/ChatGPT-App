import 'package:bloc/bloc.dart';
import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/cubit/bloc_observer.dart';
import 'package:chatgpt/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const ChatGPT());
}

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
        home: HomeScreen(),
      ),
    );
  }
}
