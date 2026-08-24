import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/chat_msg_entities.dart';
import 'image_picker_body.dart';

class InputMsg extends StatelessWidget {

  /// Function created to send the message to the parent widget
  final Function(ChatMessageEntity) onSend;

  InputMsg({super.key, required this.onSend});

  final chatController = TextEditingController();

  void onSendBtnPressed(){
    print('Chat Message  - ${chatController.text}');

    /// this child widget calling the function from parent widget & passing the new message to the parent widget
    final newChatMsg = ChatMessageEntity(
      text: chatController.text,
      id: '244',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      author: Author(userName: 'akhil'),
    );

    /// calling the function from parent widget & passing the new message to the parent widget
    onSend(newChatMsg);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 55),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                showBottomSheet(context: context, builder: (BuildContext context){
                  return ImagePickerBody();
                });
              },
              icon: Icon(Icons.add, color: Colors.white,),
            ),


            Expanded(
                child: TextField(
                  /// Taking the input for nextLine..
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 1,

                  /// added controller
                  controller: chatController,

                  /// Text Captilisation
                  textCapitalization: TextCapitalization.sentences,


                  decoration: InputDecoration(
                    hintText: 'Type ur msg',
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none
                  ),
                )
            ),


            IconButton(
              /// calling the function
              onPressed: onSendBtnPressed,
              icon: Icon(
                Icons.send,
                color: Colors.white,
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
      );
  }
}