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
      home: ScreenX(),
    );
  }
}
class ScreenX extends StatelessWidget {
  const ScreenX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen X"),),
      body: Center(child: ElevatedButton(onPressed: (

      )=>{
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ScreenY(),
        settings: const RouteSettings(arguments: "data from X")))
      }, child: Text("Next")),)
    );
  }
}

class ScreenY extends StatelessWidget {
  const ScreenY({super.key});

  @override
  Widget build(BuildContext context) {
    final text = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: const Text("Screen Y"),),
      body: Center(child: ElevatedButton(onPressed: ()=>{
        Navigator.pop(context),
      }, child: Text(text)),)
    );
  }
}
