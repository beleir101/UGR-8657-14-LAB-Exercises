import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation Demo",
      home: ScreenOne(),
    );
  }
}
class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen One"),),
      body: Center(child: ElevatedButton(onPressed: (

      )=>{
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ScreenTwo()))
      }, child: Text("Next")),)
    );
  }
}

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen One"),),
      body: Center(child: ElevatedButton(onPressed: ()=>{
        Navigator.pop(context),
      }, child: Text("Back")),)
    );
  }
}
