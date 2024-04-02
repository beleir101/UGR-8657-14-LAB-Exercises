import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Cart',
      
      home:Scaffold(
      appBar: AppBar(
        title: const Text('cart',
        style: TextStyle(color: Colors.orange),),
        backgroundColor: Color.fromARGB(255, 241, 240, 240),
        centerTitle: true,
      ), 
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Row(
            children: [Icon(Icons.shop),
            Column(children: [Center(
              child: Text("Shopping Cart")), Text("Verifiy Your Quantity and checkoyut",
            style: TextStyle(fontWeight: FontWeight.w300),
            )],)]),
          Card(
          elevation: 50,
          shadowColor: Colors.black,
          color: Color.fromARGB(255, 228, 233, 230),
          child: SizedBox(
            width: 700,
            height: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Row(children: [Image.asset("2.jpg"),
              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text("Calas",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic,))),
              
                ]),
                Column(children: [Padding(
                                padding: const EdgeInsets.only(right: 50.0, top: 100.0),
                                child: Text("1.0",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic,))),]
            ),
        ])

          
        )
        ),Card(
          elevation: 50,
          shadowColor: Colors.black,
          color: Color.fromARGB(255, 228, 233, 230),
          child: SizedBox(
            width: 700,
            height: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Row(children: [Image.asset("3.jpg"),
              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text("Angel Hair",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic,))),
              
                ]),
                Column(children: [Padding(
                                padding: const EdgeInsets.only(right: 50.0, top: 100.0),
                                child: Text("1.0",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic,))),]
            ),
        ])

          
        )
        ),]) 
      )));
  }
}