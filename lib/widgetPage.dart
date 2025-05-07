import 'package:flutter/material.dart';

class widgetPage extends StatefulWidget {
  @override
  _widgetPageState createState() => _widgetPageState();
}

class _widgetPageState extends State<widgetPage> {
  bool isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.5;
  String selectedRadio = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child:Scaffold(
      appBar: AppBar(
        title: Text('Widgets Showcase'),
        bottom: TabBar(
          tabs: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Drawer Header')),
            ListTile(
              title: Text('Show Snackbar'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('This is a Snackbar')),
                );
              },
            ),
            ListTile(
              title: Text('Show Dialog'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    title: Text('Choose an Option'),
                    children: [
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context, 'Option 1');
                        },
                        child: Text('Option 1'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context, 'Option 2');
                        },
                        child: Text('Option 2'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              children: [
                Center(child: Text('Content for Tab 1')),
                Center(child: Text('Content for Tab 2')),
                Center(child: Text('Content for Tab 3')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Checkbox:'),
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Radio:'),
                    Radio<String>(
                      value: 'Option 1',
                      groupValue: selectedRadio,
                      onChanged: (String? value) {
                        setState(() {
                          selectedRadio = value!;
                        });
                      },
                    ),
                    Text('Option 1'),
                    Radio<String>(
                      value: 'Option 2',
                      groupValue: selectedRadio,
                      onChanged: (String? value) {
                        setState(() {
                          selectedRadio = value!;
                        });
                      },
                    ),
                    Text('Option 2'),
                  ],
                ),
                Row(
                  children: [
                    Text('Switch:'),
                    Switch(
                      value: isSwitched,
                      onChanged: (bool value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Slider:'),
                    Slider(
                      value: sliderValue,
                      onChanged: (double value) {
                        setState(() {
                          sliderValue = value;
                        });
                      },
                    ),
                    Text('Value: ${sliderValue.toStringAsFixed(2)}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      ), );
  }
}
