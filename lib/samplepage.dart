import 'package:flutter/material.dart';

class Samplepage extends StatefulWidget {
  const Samplepage({super.key});

  @override
  State<Samplepage> createState() => _SamplepageState();
}

class _SamplepageState extends State<Samplepage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;


  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
  Future<void> selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5E6DA),
      appBar: AppBar(
        title: Text("Cupfulcafe"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
            
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back_ios_new),
                ),
                Text("welcome", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    isDense: true,
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.brown, width: 5)
                    ),
                    prefixIcon: Icon(Icons.search_sharp,color: Colors.brown,)
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    color: Colors.brown,
                    image: DecorationImage(image: AssetImage("assets/coffee.jpg"),fit: BoxFit.cover)
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top:5,
                          right: 5,
                          child: CircleAvatar(radius: 18,child: Icon(Icons.favorite_border),),)
                    ],
                  ),
            
                ),
                SizedBox(height: 15,),
                Text("Daily Specials",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.brown),),
            
                SizedBox(
                  height: 130,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                          color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Page 1", style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold,color: Colors.brown),
                              ),
                            ),
                            SizedBox(height: 15,),
                            ListTile(
                              leading: Container(height: 200,width: 50,decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage("assets/coffee.jpg"),fit: BoxFit.cover)
                              ),),
                              title: Text("Cold Coffee",style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold,color: Colors.brown),),
                              subtitle: Text("\$250",style: TextStyle(fontSize: 15, color: Colors.brown),),
                              trailing: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  height: 40,width: 40,color: Colors.black26,
                                  child: Icon(Icons.add),
                                ),
                              )
                            )
                          ],
                        )
            
                      ),
                      Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text("Page 2", style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold,color: Colors.brown),
                                ),
                              ),
                              SizedBox(height: 15,),
                              ListTile(
                                  leading: Container(height: 200,width: 50,decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage("assets/coffee.jpg"),fit: BoxFit.cover)
                                  ),),
                                  title: Text("Cold Coffee",style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold,color: Colors.brown),),
                                  subtitle: Text("\$250",style: TextStyle(fontSize: 15, color: Colors.brown),),
                                  trailing: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(
                                      height: 40,width: 40,color: Colors.black26,
                                      child: Icon(Icons.add),
                                    ),
                                  )
                              )
                            ],
                          )

                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Delivery method",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Row(
                    children: [
                    Card(
                    color: Colors.brown,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Pick Up",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
            
                      SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: () {},
            
                        child: Text(
                          "Delivery",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Scheduled Pick Up",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.brown),),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Text("Choose date",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.brown),),
                      SizedBox(width: 50),
                      ElevatedButton(
                        onPressed: () => selectDate(context),
                        child: Text("Choose a Date",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.brown),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Text("Choose Time",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.brown),),
                      SizedBox(width: 60),
                      ElevatedButton(
                        onPressed: () => selectTime(context),
                        child: Text("Pick a Time",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.brown),),
                      ),
                    ],
            
            
                  ),
                ),
                Center(child: ElevatedButton(onPressed: (){}, child: Text("submit")))
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
