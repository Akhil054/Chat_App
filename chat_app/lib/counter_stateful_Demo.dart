import 'package:flutter/material.dart';


class CounterStateful extends StatefulWidget {
  /// value coming from main class
  /// widget variable
  Color buttonColor;

  CounterStateful({Key? key, required this.buttonColor}) : super(key: key);

  /// Its a bascially abstract class which has abstract method called create state
  @override
  State<CounterStateful> createState() => _CounterStatefulState();
}

/// This is subclass of state
/// this class contain mutable state & Widget build method
/// part of dart class associated with statefull widget
class _CounterStatefulState extends State<CounterStateful> {

  /// state value
  int counter  = 0;

  /// method created to inc
  void increment(){
    /// calling the setState method around inc logic & telling widget to rebuild..
    /// Tells the Ui to redraw
    setState(() {
      counter++;
    });

  }

  @override
  void initState(){

    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.buttonColor,
        child: Icon(Icons.add),
        onPressed: () {
          /// calling the inc method
          increment();
        },
      ),
      body: Center(
        child: Text(
          '$counter',
          style: TextStyle(fontSize:30),
        ),
      )
    );
  }

}