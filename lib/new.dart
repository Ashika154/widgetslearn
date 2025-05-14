import 'package:flutter/material.dart';



class colorchange extends StatefulWidget {
  @override
  _colorchangeState createState() => _colorchangeState();
}

class _colorchangeState extends State<colorchange> {
  int selectedIndex = -1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' Change Color')),
      body: Column(
        children: [
          ListTile(title: Text('yellow'),
            tileColor: selectedIndex == 0 ? Colors.greenAccent : null,
            onTap: () {
              setState(() {
                  selectedIndex = 0;
              });
            },
          ),
          ListTile(title: Text('red'),
            tileColor: selectedIndex == 1 ? Colors.red[200] : null,
            onTap: () {
              setState(() {
                   selectedIndex = 1;
              });
            },
          ),
          ListTile(
               title: Text('purple'),
            tileColor: selectedIndex == 2 ? Colors.purpleAccent[100] : null,
            onTap: () {
              setState(() {selectedIndex = 2;
              });
            },
          ),
          ListTile(
            title: Text('blue'),
              tileColor: selectedIndex == 3 ? Colors.blue : null,
            onTap: () {
              setState(() {selectedIndex = 3;
              });
            },
          ),],
      ),);}
}