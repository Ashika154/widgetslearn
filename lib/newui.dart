import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text(
          "Updates",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.qr_code_scanner),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search_sharp),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Status",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                      itemBuilder: (context,index){
                  return Container(
                    height: 200,
                    width: 130,
                    margin: EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      image: const DecorationImage(
                        image: AssetImage("assets/universe.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                      Positioned(
                      top:5,
                      left: 5,
                      child: CircleAvatar(radius: 23,),

                    ),
                        if (index == 0)
                        Positioned(
                          top:30,
                          left: 29,
                          child: CircleAvatar(radius: 10,backgroundColor: Colors.greenAccent,
                            child: Icon(Icons.add,size: 15,),),

                        ),
                   ] ),
                  );
                  }),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Text("Channels",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                  Spacer(),
                  TextButton(onPressed: (){},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // Text color
                      backgroundColor: Colors.black12,
                    ),
                    child: Text("Explore"),

                  )
                ],
              ),
            ),
              ListTile(

                leading: CircleAvatar(radius: 25,),
                title: Row(
                  children: [
                    Text("Let's code"),
                    Spacer(),
                    Text("11:11 AM",style: TextStyle(fontSize: 10,color: Colors.green),)
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text("Roadmap & resources"),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 10,child: Text("4"),)
                  ],
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Find channels to follow",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                    ),
                  child: Text('Explore more',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
                )

                ),
              ),


],
          ),

        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
            BottomNavigationBarItem(icon: Icon(Icons.update_sharp), label: "Updates"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Communities"),
            BottomNavigationBarItem(icon: Icon(Icons.call), label: "calls"),
          ],
        ),



    );
  }
}
