import 'package:flutter/material.dart';

class ColorChange extends StatefulWidget {
  const ColorChange({super.key});

  @override
  _ColorChangeState createState() => _ColorChangeState();
}

class _ColorChangeState extends State<ColorChange> {
  int selectedIndex = -1;

  final List<Color> tileColors = [
    Colors.greenAccent,
    Colors.redAccent,
    Colors.purpleAccent,
    Colors.blueAccent,
    Colors.grey,
  ];

  final List<String> tileLabels = [
    'Green',
    'Red',
    'Purple',
    'Blue',
    'Grey',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Tile Color')),
      body: ListView.builder(
        itemCount: tileLabels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tileLabels[index]),
            tileColor: selectedIndex == index ? tileColors[index] : null,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
