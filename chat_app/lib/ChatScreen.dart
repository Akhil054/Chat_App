import 'dart:convert';
import 'dart:math';
import 'package:chat_app/LoginPage.dart';
import 'package:chat_app/models/chat_msg_entities.dart';
import 'package:chat_app/models/image_model.dart';
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

  ///calling it on inital & setting the new state of class
  @override
  void initState() {
    _loadInitialMessages();
    _getNetworkImages();
  }

  /// adding the new message to the list of messages
  onMessageSend(chatMsg){
    setState(() {
      _messages.add(chatMsg);
    });
  }


  /// Working with api --
  Future<List<ImageModel>> _getNetworkImages() async {
    var endpointUrl = Uri.parse('https://pixelford.com/api2/images');

    /// getting response string & convert to dart obj
    final response = await http.get(endpointUrl);

    /// better with error handling
    if(response.statusCode == 200){

      /// decoding the list of dynamics & converting to list
      final List<dynamic> decodedList = jsonDecode(response.body) as List;

      /// converting the response to a list of Image
      final List<ImageModel> _imglist = decodedList.map((listItems){
        return ImageModel.fromJson(listItems);
      }).toList();

      print(_imglist[0].urlFullSize);
      return _imglist;
    }
    else{
      throw Exception('API not successfull');
    }
  }


  @override
  Widget build(BuildContext context) {
    _getNetworkImages();

    /// using ModalRoute for routes
    final username = ModalRoute.of(context)?.settings.arguments as String? ?? 'Guest';

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
          FutureBuilder<List<ImageModel>>(
              future: _getNetworkImages(), builder: (BuildContext context, AsyncSnapshot<List<ImageModel>> snapshot){
                if(snapshot.hasData) return Image.network(snapshot.data![0].urlSmallSize);

                return CircularProgressIndicator();
          }),

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
