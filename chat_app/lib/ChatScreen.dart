import 'dart:convert';
import 'dart:math';
import 'package:chat_app/LoginPage.dart';
import 'package:chat_app/models/chat_msg_entities.dart';
import 'package:chat_app/models/image_model.dart';
import 'package:chat_app/repository/img_repo.dart';
import 'package:chat_app/widgets/ChatBubble.dart';
import 'package:chat_app/widgets/InputMsg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Chatscreen extends StatefulWidget {

  /// Function created to logout & navigate to login screen again
  // void logOut(context){
  //   Navigator.pop(context, MaterialPageRoute(builder: (context) => LoginPage(),),);
  // }

  /// passing the variable with navigation
  // final String username;

  Chatscreen({Key ? key, }) : super(key: key);

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {

  /// intial state of messages
  List<ChatMessageEntity> _messages = [];

  // created the method for loading the messages from the mock data
  // _loadInitialMessages() async {
  //
  //   final response  = await rootBundle.loadString('assets/mock_msg.json');
  //
  //   ///decoding the json data in form of List & if data is direct then it decoded in hashmap format
  //   final List<dynamic> decodedList = jsonDecode(response) as List;
  //
  //   /// converting the response to a list of ChatMessageEntity
  //   final List<ChatMessageEntity> messages = decodedList.map((listItems){
  //     return ChatMessageEntity.fromJson(listItems);
  //   }).toList();
  //
  //   /// final state of messages
  //   setState(() {
  //     _messages = messages;
  //   });
  // }

  /// Using .then() method
  _loadInitialMessages() async {

    rootBundle.loadString('assets/mock_msg.json').then((response){
      ///decoding the json data in form of List & if data is direct then it decoded in hashmap format
      final List<dynamic> decodedList = jsonDecode(response) as List;

      /// converting the response to a list of ChatMessageEntity
      final List<ChatMessageEntity> messages = decodedList.map((listItems){
        return ChatMessageEntity.fromJson(listItems);
      }).toList();

      /// final state of messages
      setState(() {
        _messages = messages;
      });

    }).then((_){
      print('done!');
    });
  }

  /// Created the obj of Image Repo

  ///calling it on inital & setting the new state of class
  @override
  void initState() {
    _loadInitialMessages();
  }

  /// adding the new message to the list of messages
  onMessageSend(chatMsg){
    setState(() {
      _messages.add(chatMsg);
    });
  }




  @override
  Widget build(BuildContext context) {

    /// using ModalRoute for routes
    final username = ModalRoute.of(context)?.settings.arguments as String? ?? 'Guest';

    return Scaffold(
      backgroundColor: Colors.white,
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
              itemCount: _messages.length,
              itemBuilder: (context, index){
              return ChatBuble(
                  alignment: _messages[index].author.userName == 'akhil'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  entity: _messages[index]
              );
            },
          ),
          ),
          /// Imported the Imput Msg Widget
          InputMsg(onSend: onMessageSend),
        ],
      )
    );
  }
}
