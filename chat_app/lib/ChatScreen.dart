import 'dart:math';

import 'package:chat_app/LoginPage.dart';
import 'package:chat_app/models/chat_msg_entities.dart';
import 'package:chat_app/widgets/ChatBubble.dart';
import 'package:chat_app/widgets/InputMsg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chatscreen extends StatelessWidget {

  /// Function created to logout & navigate to login screen again
  // void logOut(context){
  //   Navigator.pop(context, MaterialPageRoute(builder: (context) => LoginPage(),),);
  // }

  /// passing the variable with navigation
  // final String username;

  const Chatscreen({Key ? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /// using ModalRoute for routes
    final username = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        /// passing the name var..
        title:Text('Hii ${username}'),
        actions: [
          IconButton(onPressed: () {
            ///used for pushReplacementRoutes
            Navigator.pushReplacementNamed(context, '/');
          },
              icon: Icon(Icons.logout_outlined)),
        ],
      ),

      body:Column(
        children: [
          /// making it dynamic by using ListView.builder
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index){
              return ChatBuble(
                  alignment: index % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  entity: ChatMessageEntity(
                      text: 'Akhil',
                      id: '1234',
                      createdAt: DateTime.now().microsecondsSinceEpoch,
                      author: Author(userName: 'Akhil')
                  ));
            },
          ),
          ),
          /// Imported the Imput Msg Widget
          InputMsg(),
        ],
      )
    );
  }
}
