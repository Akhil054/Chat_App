import 'package:chat_app/models/chat_msg_entities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {

  /// Taken from model class
  final ChatMessageEntity entity;

  /// Constructor..
  final Alignment alignment;

  const ChatBuble({super.key, required this.alignment, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.5,
        ),
        /// Abt the msg
        padding: EdgeInsets.all(24),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.lightBlue[100],
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
              Image.network(
                '${entity.imageUrl}', width: 200, height: 200
            ),
          ],
        ),
      ),
    );
  }
}