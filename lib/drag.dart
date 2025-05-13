import 'dart:async';
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

  Stream<int> liveOrderCount() async* {
    int count = 50;
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield count++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primarySwatch: Colors.brown),
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 180,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text("Cupfulcafe"),
                    background: CustomPaint(
                         painter: BackgroundPainter(),
                      child: Container(),
                    ),
                  ),
                  leading: Icon(Icons.arrow_back_ios_new),
                  centerTitle: true,
                  backgroundColor: Color(0xFFA1887F),
                ),


                SliverToBoxAdapter(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("My Cart",
                              style: TextStyle(fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Hot Drinks",
                                  style: TextStyle(fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown)),
                              Spacer(),

                              Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                  });
                                },
                                activeColor: Colors.brown,
                                inactiveThumbColor: Colors.brown,)
                            ],
                          ),
                          Row(
                            children: [
                              Text("Cold Drinks",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown)),
                              Spacer(),
                              Switch(
                                value: isSwitch,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitch = value;});
                                },
                                activeColor: Colors.brown,
                                inactiveThumbColor: Colors.brown,)
                            ],
                          ),
                          const SizedBox(height: 10),
                          StreamBuilder<int>(
                            stream: liveOrderCount(),
                            builder: (context, snapshot) {
                              return Text(
                                "Live Orders: ${snapshot.data ?? 'Loading...'}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown.shade800,
                                ),
                              );},
                          ),
                        ],
                      ),),
                  ),
                ),
                SliverList(
                      delegate: SliverChildListDelegate([
                      ReorderableListView(
                      shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                      onReorder: (oldIndex, newIndex) {
                        setState(() {
                          if (newIndex > oldIndex) newIndex -= 1;
                          final item = items.removeAt(oldIndex);items.insert(newIndex, item);
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
                                onDraggableCanceled: (_, __) =>
                                draggedItem = null,
                                onDragEnd: (_) => draggedItem = null,
                                feedback: Material(
                                  color: Colors.transparent,
                                  child: SizedBox(width:
                                    MediaQuery.of(context).size.width * 0.9,
                                    child: _buildListTile(items[index]),
                                  ),
                                ),
                                childWhenDragging: Opacity(opacity: 0.3,
                                  child: _buildListTile(items[index]),
                                ),
                                child: _buildListTile(items[index]),
                              ),


                            ),
                          ),
                      ],
                    ), Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: DragTarget<String>(
                          onAccept: (data) {
                            setState(() {items.remove(data);
                              draggedItem = null;
                            });
                          },
                            builder: (context, candidateData, rejectedData) {
                            return FloatingActionButton(
                              onPressed: () {},
                              backgroundColor: candidateData.isNotEmpty ? Colors.red
                                  : Colors.brown,
                              child: Icon(Icons.delete),
                            );
                          },),
                      ),
                    ),]),
                ),

                SliverToBoxAdapter(
                  child: SizedBox(height: 200),
                ),],
            );
          },),
      ),);
  }

  Widget _buildListTile(String title) {
    return ListTile(
      tileColor: Color(0xFFF5E6DA),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
      leading: Container(
        height: 200, width: 50,
        decoration: BoxDecoration(image: DecorationImage(
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
          color: Colors.brown,),
      ),
      subtitle: Text(
        "\$250",
        style: TextStyle(fontSize: 15, color: Colors.brown),
      ),
      trailing: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 40, width: 40,
          color: Colors.black26,
          child: Icon(Icons.add),
        ),),);
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
      final paint = Paint()
      ..color = Colors.brown.shade200
      ..style = PaintingStyle.fill;

      Rect ovalRect = Rect.fromLTWH(50, 50, 250, 100);
    canvas.drawOval(ovalRect, paint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: "Coffee Time!",
        style: TextStyle(color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final offset = Offset(

      ovalRect.left + (ovalRect.width - textPainter.width) / 2,
      ovalRect.top + (ovalRect.height - textPainter.height) / 2,
    );

    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
