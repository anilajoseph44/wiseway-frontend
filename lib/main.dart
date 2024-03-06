import 'package:flutter/material.dart';
import 'package:wise_way/pages/firstpage.dart';

void main() {
  runApp(const WiseWay());
}

class WiseWay extends StatelessWidget {
  const WiseWay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

