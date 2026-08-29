import 'dart:math';

import 'package:chat_app/ChatScreen.dart';
import 'package:chat_app/utils/BrandColors.dart';
import 'package:chat_app/utils/textfield_Styles.dart';
import 'package:chat_app/widgets/login_Textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  void loginUser(context){

    if(_formKey.currentState!=null && _formKey.currentState!.validate()){
      
      print(userNameController.text);
      print(userPassController.text);
      print('login successfull!');
    }
    else {
      print('Not successfull');
    }

    /// Navigation
    /// Not added the screen stack i.e takes new routes & replaces with current route..
    Navigator.pushReplacementNamed(
      context, '/chatpage', arguments: '${userNameController.text}',
    );
  }

  /// Object of Text Editing Controller..
  final userNameController = TextEditingController();
  final userPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          /// added padding that assign to button too
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                Text('Lets sign you in..',
                textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: Brandcolors.chatInputColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),

            const SizedBox(height: 20),

              /// Taking user input with the widget FormField coz it has validate property & wrapping them col & FORM for success validation
              Form(
                /// associating the form key with textfield to get validation
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,    ///taken the space available
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/LoginPage.jpg')),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    /// Taking the Text Input
                    LoginTextfield(
                      hintText: "Enter ur UserName",
                      controller: userNameController,   //refer the object of TextEditingController
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Username is required';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    LoginTextfield(
                      hintText: "Enter ur password",
                      hasAstricks: true,
                      controller: userPassController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),

                    
                  ],
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                  onPressed: (){
                    loginUser(context);
                  },
                  child: Text('Log In! ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)
              ),

              const SizedBox(height: 20),

              GestureDetector(
                child: Column(
                  children: [
                    Text('Find me on',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SocialMediaButton.linkedin(
                    onTap: () async {
                      if(!await launch('https://www.linkedin.com/in/akhil-tamgaonkar-100096192/',)){
                        throw 'Could not launch this';
                      }
                    },
                  )
                ]
              )
            ]
          ),
        ),
      ),
    );
  }
}