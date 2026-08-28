import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/chat_msg_entities.dart';
import 'image_picker_body.dart';

class InputMsg extends StatefulWidget {

  /// Function created to send the message to the parent widget
  final Function(ChatMessageEntity) onSend;

  InputMsg({super.key, required this.onSend});

  @override
  State<InputMsg> createState() => _InputMsgState();
}

class _InputMsgState extends State<InputMsg> {
  final chatController = TextEditingController();

  String _selectedImageUrl = '';

  void onSendBtnPressed(){
    print('Chat Message  - ${chatController.text}');

    /// this child widget calling the function from parent widget & passing the new message to the parent widget
    final newChatMsg = ChatMessageEntity(
      text: chatController.text,
      id: '244',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      author: Author(userName: 'akhil'),
    );

    /// passing up the image in chatmessages
    if(_selectedImageUrl.isNotEmpty){
      newChatMsg.imageUrl = _selectedImageUrl;
    }
    /// calling the function from parent widget & passing the new message to the parent widget
    widget.onSend(newChatMsg);

    /// done so to clear the images & message written in chatInput
    chatController.clear();
    _selectedImageUrl = '';
    setState(() {});
  }

  void onImagePicked(String newImageUrl)
  {
    setState(() {
      _selectedImageUrl = newImageUrl;

    });
    Navigator.of(context).pop();
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
                  return ImagePickerBody(
                    onImageSelected: onImagePicked,);
                });
              },
              icon: Icon(Icons.add, color: Colors.white,),
            ),


            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
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
                    ),
                    /// created the widget
                    if(_selectedImageUrl.isNotEmpty)
                      Image.network(_selectedImageUrl, height: 80,),
                  ],
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