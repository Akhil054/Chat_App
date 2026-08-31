import 'package:chat_app/models/chat_msg_entities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../services/auth_services.dart';
import 'package:provider/provider.dart';

class ChatBuble extends StatelessWidget {

  /// Taken from model class
  final ChatMessageEntity entity;

  /// Constructor..
  final Alignment alignment;

  const ChatBuble({super.key, required this.alignment, required this.entity});

  @override
  Widget build(BuildContext context) {
    bool isAuthor = entity.author.userName == context.read<AuthServices>().getUserName();
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6,
        ),

        /// Abt the msg
        padding: EdgeInsets.all(24),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          // color: Colors.lightBlue[100],
          color: isAuthor ? Theme.of(context).primaryColor : Colors.blueGrey,
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${entity.text}',
              style: TextStyle(
                  color: Colors.black, fontSize: 20
              ),),
            if(entity.imageUrl != null && entity.imageUrl!.isNotEmpty)
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,    ///taken the space available
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(entity.imageUrl!)),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}