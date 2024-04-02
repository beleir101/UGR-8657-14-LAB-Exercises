import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                    "                                                                "),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.file_download_sharp),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              '4.jpg',
              height: 400,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                '1955 porshe 911 Carrera',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
             Row(children: [
              Icon(Icons.check_circle, color: Colors.green),
              Text("     Year, Make Model, Vin")
            ]),
            const Text("Year: 1975"),
            const Text("Make: porshe"),
            const Text("Model: 911 carrera"),
            const Text("VIR: 12213234325"),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
             Row(children: [
              Icon(Icons.check_circle, color: Colors.grey),
              Text("      Description")
            ]),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
             Row(children: [
              Icon(Icons.check_circle, color: Colors.grey),
              Text("      Photos")
            ]),
          ],
        ),
      ),
    );
  }
}
