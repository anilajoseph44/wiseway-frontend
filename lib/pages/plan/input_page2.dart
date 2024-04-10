import 'package:flutter/material.dart';
import 'package:wise_way/pages/plan/input_page3.dart';

class InputPage2 extends StatefulWidget
{

  const InputPage2({Key? key});

  @override
  State<InputPage2> createState() => _InputPage2State();

}

class _InputPage2State extends State<InputPage2> {
  bool _isButtonEnabled = false;
  TextEditingController _startingPointController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
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
                  controller: _startingPointController,
                  onChanged: (value) {
                    setState(() {
                      _isButtonEnabled = value.isNotEmpty && _destinationController.text.isNotEmpty;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Starting Point",
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _destinationController,
                  onChanged: (value) {
                    setState(() {
                      _isButtonEnabled = value.isNotEmpty && _startingPointController.text.isNotEmpty;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Destination",
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: Container()),
                    IconButton(
                      onPressed: _isButtonEnabled
                          ? () {
                        
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>InputPage3()));
                        // Handle button press
                      }
                          : null,
                      icon: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _isButtonEnabled ? Colors.green.shade900 : Colors.grey,
                        ),
                        child: Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
