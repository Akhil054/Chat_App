import 'package:chat_app/ChatScreen.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/LoginPage.dart';
import 'package:chat_app/counter_stateful_Demo.dart';
import 'package:provider/provider.dart';


void main() async {

  /// initlise mthd is called & awaited to ensure sp is ready befire app start
  WidgetsFlutterBinding.ensureInitialized();
  await AuthServices.init();

  runApp(ChangeNotifierProvider(
    create:(BuildContext context) => AuthServices(),
    child:ChatApp(),
  ));
}

class ChatApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return  MaterialApp(
       theme: ThemeData(
         canvasColor: Colors.transparent,
           primarySwatch: Colors.deepPurple,
       appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurpleAccent, foregroundColor: Colors.black,)
       ),
       debugShowCheckedModeBanner: false,
       title: "Flutter Chat App",
      // home: CounterStateful(buttonColor: Colors.blue),
       home: LoginPage(),

       /// routes
       routes: {
         '/chatpage': (context) => Chatscreen(),
       },
     );
  }
}


