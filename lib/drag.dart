import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> items = ['Cold Coffee ', 'hot Coffee ', 'Cold Coffee '];
  String? draggedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA1887F),
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
        title: const Text("Cupfulcage"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "My Cart",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Draggable<String>(
                      data: item,
                      onDragStarted: () => draggedItem = item,
                      onDraggableCanceled: (_, __) => draggedItem = null,

                      onDragEnd: (_) => draggedItem = null,
                         feedback: Material(
                          color: Colors.transparent,
                            child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: _buildListTile(item),
                        ),
                      ),
                      childWhenDragging: Opacity(
                        opacity: 0.3,
                        child: _buildListTile(item),
                      ),
                      child: _buildListTile(item),
                    ),
                  );
                },
              ),
            ),

            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: DragTarget<String>(
                onAccept: (data) {
                  setState(() {
                    items.remove(data);
                    draggedItem = null;
                  });
                },
                builder: (context, candidateData, rejectedData) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: candidateData.isNotEmpty ? Colors.brown : Colors.brown,
                      child: const Icon(Icons.delete),
                    ),

                  );},
              ),
               ),],
        ),
      ),
    );
  }

  Widget _buildListTile(String title) {
    return ListTile(
      tileColor: const Color(0xFFF5E6DA),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
      leading: Container(
        height: 200,
        width: 50,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/coffee.jpg"),
            fit: BoxFit.cover,),
        ),),
      title: Text(title,
        style:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.brown),
      ),
      subtitle:  Text(
        "\$250",
        style: TextStyle(fontSize: 15, color: Colors.brown),
      ),
      trailing: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 40,
          width: 40,
          color: Colors.black26,
          child:  Icon(Icons.add),
        ),
      ),
    );
  }
}
