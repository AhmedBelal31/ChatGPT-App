import 'package:chatgpt/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ChatGPT());
}

class ChatGPT extends StatelessWidget {
  const ChatGPT({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGPT',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: cardColor),
      //   useMaterial3: true,
      //   scaffoldBackgroundColor: scaffoldBackgroundColor ,
      //   appBarTheme: AppBarTheme(
      //     color: cardColor ,
      //   ) ,
      //   textTheme: GoogleFonts.montserratTextTheme(),
      // ),
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        scaffoldBackgroundColor: scaffoldBackgroundColor ,
          appBarTheme: AppBarTheme(
            color: cardColor ,
          ) ,
       // textTheme:GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme) ,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
