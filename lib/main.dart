
import 'package:acvmxhomepage/Samplepage.dart';
import 'package:acvmxhomepage/drag.dart';
import 'package:acvmxhomepage/widgetPage.dart';
import 'package:flutter/material.dart';

import 'FoodPage.dart';
import 'new.dart';


void main() {
  runApp(const WhatsAppUI());
}

class WhatsAppUI extends StatelessWidget {
  const WhatsAppUI({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home : ColorChange(),
    );
  }
}


