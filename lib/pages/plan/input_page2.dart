import 'package:flutter/material.dart';

class InputPage2 extends StatefulWidget {
  const InputPage2({Key? key});

  @override
  State<InputPage2> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Image.asset(
                  'assets/screenshotlogo-removebg.png',
                  height: 150,
                ),
                Text(
                  "Enter Details",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Starting Point",
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Destination",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
