import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {

  /// Constructor..
  final String message;
  final Alignment alignment;

  const ChatBuble({super.key, required this.message, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
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
            Text('$message',
              style: TextStyle(
                  color: Colors.black, fontSize: 20
              ),),
            Image.asset('assets/sky.jpg', width: 200, height: 200),
          ],
        ),
      ),
    );
  }
}