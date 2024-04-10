import 'package:flutter/material.dart';

class InputPage3 extends StatefulWidget {
  const InputPage3({Key? key});

  @override
  State<InputPage3> createState() => _InputPage3State();
}

class _InputPage3State extends State<InputPage3> {
  bool _isButtonEnabled = false;
  TextEditingController _startingDateController = TextEditingController();
  TextEditingController _endingDateController = TextEditingController();
  TextEditingController _numberOfPeopleController = TextEditingController();
  TextEditingController _vehicleMileageController = TextEditingController();
  bool _stayNeeded = false;

  @override
  void initState() {
    super.initState();
    _startingDateController.text = _formatDate(DateTime.now());
    _endingDateController.text = _formatDate(DateTime.now());
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        controller.text = _formatDate(picked);
        _updateButtonState("");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
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
                    controller: _startingDateController,
                    readOnly: true,
                    onTap: () => _selectDate(context, _startingDateController),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Starting Date",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _endingDateController,
                    readOnly: true,
                    onTap: () => _selectDate(context, _endingDateController),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ending Date",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _numberOfPeopleController,
                    onChanged: _updateButtonState,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Number of People",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _vehicleMileageController,
                    onChanged: _updateButtonState,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Vehicle Mileage (Optional)",
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: _stayNeeded,
                        onChanged: (value) {
                          setState(() {
                            _stayNeeded = value!;
                          });
                        },
                      ),
                      Text("Stay Needed"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(child: Container()),
                      IconButton(
                        onPressed: _isButtonEnabled ? _handleButtonPress : null,
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
      ),
    );
  }

  void _updateButtonState(String value) {
    setState(() {
      _isButtonEnabled = _startingDateController.text.isNotEmpty &&
          _endingDateController.text.isNotEmpty &&
          _numberOfPeopleController.text.isNotEmpty;
    });
  }

  void _handleButtonPress() {
    // Handle button press
  }
}
