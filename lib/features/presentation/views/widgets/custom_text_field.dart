// import 'package:chatgpt/constants/constants.dart';
// import 'package:chatgpt/constants/styles.dart';
// import 'package:chatgpt/cubit/cubit.dart';
// import 'package:flutter/material.dart';
//
// class CustomTextField extends StatefulWidget {
//   const CustomTextField({super.key , required this.textFormFieldControllerValue });
//   final String textFormFieldControllerValue ;
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//
//
//   TextEditingController textFormFieldController = TextEditingController();
//
//
//
//   @override
//   void dispose() {
//     textFormFieldController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: cardColor,
//       child: Padding(
//         padding: const EdgeInsets.all(6.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: TextFormField(
//                 controller: textFormFieldController,
//                 style: Styles.textStyle16,
//                 onFieldSubmitted: (value) {
//                   AppCubit().get(context).getResponseMessage(value);
//                   textFormFieldController.clear();
//                 },
//                 decoration: const InputDecoration(
//                     border: InputBorder.none,
//                     hintText: '  How Can I help you '),
//               ),
//             ),
//             IconButton(
//                 onPressed: () {
//                   AppCubit().get(context).getResponseMessage(textFormFieldController.text);
//                   textFormFieldController.clear();
//                 },
//                 icon: const Icon(
//                   Icons.send,
//                   color: Colors.white,
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
