
import 'package:flutter/material.dart';

import 'FoodPage.dart';
import 'newui.dart';

void main() {
  runApp(const WhatsAppUI());
}

class WhatsAppUI extends StatelessWidget {
  const WhatsAppUI({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Foodpage(),
    );
  }
}


