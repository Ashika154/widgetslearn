import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> items = ['Cold Coffee', 'Hot Coffee', 'Cold Water'];
  String? draggedItem;
  bool isSwitched = true;
  bool isSwitch = true;

  bool _isItemVisible(String item) {
    if (item.toLowerCase().contains("hot")) {
      return isSwitched;
    } else if (item.toLowerCase().contains("cold")) {
      return isSwitch;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA1887F),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new),
         title: Text("Cupfulcage"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("My Cart",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Text("Hot Drinks",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.brown),
                  ),
                  Spacer(),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                            isSwitched = value;
                      });
                    },
                    activeColor: Colors.brown,
                    inactiveThumbColor: Colors.brown,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Text(

                    "Cold Drinks",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.brown),
                  ),
                  Spacer(),
                  Switch(
                    value: isSwitch,
                    onChanged: (value) {
                      setState(() {
                        isSwitch = value;
                      });
                    },
                    activeColor: Colors.brown,
                    inactiveThumbColor: Colors.brown,
                  )],
              ),),
            SizedBox(height: 25),
            Expanded(
              child: ReorderableListView(
                padding: EdgeInsets.symmetric(horizontal: 8),
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final item = items.removeAt(oldIndex);
                    items.insert(newIndex, item);
                  });
                },
                children: [
                  for (int index = 0; index < items.length; index++)
                    Visibility(
                      key: ValueKey(items[index] + index.toString()),
                      visible: _isItemVisible(items[index]),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Draggable<String>(
                          data: items[index],
                          onDragStarted: () => draggedItem = items[index],
                          onDraggableCanceled: (_, __) => draggedItem = null,
                          onDragEnd: (_) => draggedItem = null,
                          feedback: Material(
                            color: Colors.transparent,
                            child: SizedBox(width: MediaQuery.of(context).size.width * 0.9,
                              child: _buildListTile(items[index]),
                            ),
                          ),
                          childWhenDragging: Opacity(
                            opacity: 0.3,
                            child: _buildListTile(items[index]),
                          ),
                          child: _buildListTile(items[index]),
                        ),),
                    ),],
              ),


            ),
            Spacer(),
            Align(alignment: Alignment.bottomRight,
              child: DragTarget<String>(
                onAccept: (data) {
                  setState(() {
                    items.remove(data);
                    draggedItem = null;
                  });},
                builder: (context, candidateData, rejectedData) {
                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor:
                      candidateData.isNotEmpty ? Colors.red : Colors.brown,
                      child: Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(String title) {
    return ListTile(
      tileColor: Color(0xFFF5E6DA),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
      leading: Container(
        height: 200,
        width: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/coffee.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.brown,
        ),
      ),
      subtitle: Text(
        "\$250",
        style: TextStyle(fontSize: 15, color: Colors.brown),
      ),
      trailing: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 40,
          width: 40,
          color: Colors.black26,
          child: Icon(Icons.add),
        ),
      ),

    );
  }
}
