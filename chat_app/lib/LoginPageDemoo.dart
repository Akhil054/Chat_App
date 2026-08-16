// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});
//
//   void loginUser(){
//     print('login!');
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           /// added padding that assign to button too
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//                 Text('Lets sign you in..',
//                 textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 28,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//
//               /// Taking user input
//               TextField(
//                 onChanged: (){
//
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'Add User Name',
//                   hintStyle: TextStyle(color: Colors.blueGrey),
//                   border: OutlineInputBorder()
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                     hintText: 'Add password',
//                     hintStyle: TextStyle(color: Colors.blueGrey),
//                     border: OutlineInputBorder()
//                 ),
//               ),
//
//               ElevatedButton(
//                   onPressed: loginUser,
//
//                   child: Text('Click me ',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)
//               ),
//
//               TextButton(onPressed: (){
//                 print('pressed on url');
//               }, child: Text('https://my-portfolio4453.vercel.app/ ')),
//
//               ///Gestures Detection
//               GestureDetector(
//                 onTap: () {
//                   /// todo
//                   print('Link clicked');
//                 },
//
//                 onDoubleTap: (){
//                   print('Link double tap was pressed ');
//                 },
//
//                 onLongPress: (){
//                   print('Link long press was tab ');
//                 },
//
//                 child: Column(
//                   children: [
//                     Text('Find me here'),
//
//                     Text('https://my-portfolio4453.vercel.app/ '),
//                   ],
//                 ),
//               ),
//
//               /// InkWell
//               InkWell(
//                 splashColor: Colors.deepOrangeAccent,
//                 onTap: () {
//                   /// todo
//                   print('Link clicked');
//                 },
//
//                 child: Column(
//                   children: [
//                     Text('Find me here'),
//
//                     Text('https://my-portfolio4453.vercel.app/ '),
//                   ],
//                 ),
//               )
//
//
//
//             ]
//           ),
//         ),
//       ),
//     );
//   }
// }


/// PART 2 with more advance navigation & properties
/// import 'dart:math';
//
// import 'package:chat_app/ChatScreen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class LoginPage extends StatelessWidget {
//   LoginPage({super.key});
//
//   final _formKey = GlobalKey<FormState>();
//
//   void loginUser(context){
//
//     if(_formKey.currentState!=null && _formKey.currentState!.validate()){
//
//       print(userNameController.text);
//       print(userPassController.text);
//       print('login successfull!');
//     }
//     else {
//       print('Not successfull');
//     }
//
//     /// Navigation
//     // Navigator.push(
//     //     context,
//     //     MaterialPageRoute(
//     //       /// passing the name parameter & taking that text using controlller
//     //       builder: (context) => Chatscreen(username: userNameController.text),
//     //     )
//     // );
//
//     /// Using Routes
//     // Navigator.pushNamed(
//     //     context,
//     //     '/chatpage', arguments: '${userNameController.text}',
//     // );
//
//     /// Not added the screen stack i.e takes new routes & replaces with current route..
//     Navigator.pushReplacementNamed(
//       context, '/chatpage', arguments: '${userNameController.text}',
//     );
//   }
//
//   /// Object of Text Editing Controller..
//   final userNameController = TextEditingController();
//   final userPassController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           /// added padding that assign to button too
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//                 Text('Lets sign you in..',
//                 textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 28,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//
//             const SizedBox(height: 20),
//
//               /// Taking user input with the widget FormField coz it has validate property & wrapping them col & FORM for success validation
//               Form(
//                 /// associating the form key with textfield to get validation
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     /// Taking the Text Input
//                     TextFormField(
//                       ///validator properties that has callback value i.e takes the value & checks for given condition
//                       validator: (value) {
//                         if(value != null && value.isNotEmpty && value.length <= 5){
//                           return "UserName should be more than 5 characters";
//                         }
//                         else if(value !=null && value.isEmpty){
//                           return "Please Enter the username";
//                         }
//                         return null;
//                       },
//
//                       controller: userNameController,   //refer the object of TextEditingController
//                       decoration: InputDecoration(
//                         hintText: 'Add User Name',
//                         hintStyle: TextStyle(color: Colors.blueGrey),
//                         border: OutlineInputBorder()
//                       ),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     TextFormField(
//                       validator: (value){
//                         if(value != null && value.isNotEmpty && value.length<6)
//                         {
//                           return "password should be more than 5 char ";
//                         }
//                         else if(value != null && value.isEmpty)
//                         {
//                           return "Please enter the password";
//                         }
//                         return null;
//                       },
//
//                       controller: userPassController,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                           hintText: 'Add password',
//                           hintStyle: TextStyle(color: Colors.blueGrey),
//                           border: OutlineInputBorder()
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//
//               ElevatedButton(
//                   onPressed: (){
//                     loginUser(context);
//                   },
//                   child: Text('Log In! ',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)
//               ),
//
//             ]
//           ),
//         ),
//       ),
//     );
//   }
// }