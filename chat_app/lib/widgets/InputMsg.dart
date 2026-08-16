import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputMsg extends StatelessWidget {
  InputMsg({super.key});

  final chatController = TextEditingController();

  void onSendBtnPressed(){
    print('Chat Message  - ${chatController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add, color: Colors.white,),),

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