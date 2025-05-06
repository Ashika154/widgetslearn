import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

List<String>pics=["assets/noodle.jpg","assets/gardenicasalad.jpg","assets/gardenicasalad.jpg","assets/noodle.jpg","assets/gardenicasalad.jpg","assets/gardenicasalad.jpg","assets/noodle.jpg","assets/gardenicasalad.jpg","assets/gardenicasalad.jpg","assets/noodle.jpg"];
List<String>foods=["Zero Zero Noodles ","Eats Meets West","Gardenica Salad","Zero Zero Noodles ","Eats Meets West","Gardenica Salad","Zero Zero Noodles ","Eats Meets West","Gardenica Salad","Zero Zero Noodles "];
List<String>items=["3 items | 1.4km","4 items | 2.5km","2 items | 2.2km","3 items | 1.7km","5 items | 1.4km","9 items | 1.4km","4 items | 1.4km","2 items | 1.4km","1 items | 1.4km","6 items | 1.4km"];
class Foodpage extends StatelessWidget {
  const Foodpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: ListView.builder(itemCount:10,itemBuilder: (context,index){

          return
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:  Column(
                  children: [
                    Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.black12,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(19),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(19),

                                            image: DecorationImage(image: AssetImage(pics[index]),fit: BoxFit.cover)
                                        )
                                    ),
                                    SizedBox(width: 20,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start ,
                                      children: [
                                        SizedBox(height: 25,),
                                        Text(foods[index],style: TextStyle(fontWeight: FontWeight.bold),),
                                        SizedBox(height: 5,),
                                        Text(items[index],style: TextStyle(
                                            color: Colors.black
                                        ),),
                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            Text("\$32.00",style: TextStyle(color: Colors.green),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 20,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    color: Colors.green
                                                ),
                                                child: Center(

                                                  child: ElevatedButton(

                                                      onPressed: (){
                                                        Fluttertoast.showToast(msg: "cancelled",
                                                        );
                                                      },
                                                      child: Text("cancel",style: TextStyle(
                                                        backgroundColor: Colors.green,
                                                        fontSize: 7,
                                                        color: Colors.white,

                                                      ),
                                                      ),
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.green,

                                                      )
                                                  ),
                                                ),


                                              ),



                                            ),
                                          ],
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                                SizedBox(height: 15,),
                                Column(
                                  children: [
                                    Divider(
                                      height: 2,
                                      thickness: 2,
                                      color: Colors.grey,
                                      indent: 1,
                                      endIndent: 1,
                                    )
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Container(height: 25, width: 150,
                                      decoration: BoxDecoration(border: Border.all(color: Colors.green),
                                          borderRadius: BorderRadius.circular(19)),
                                      child: Center(child: ElevatedButton(
                                          onPressed: (){
                                            Dialog(context);
                                          },
                                          child: Text("Leave a Review",style: TextStyle(color: Colors.green,
                                              fontSize: 12.9),
                                          ))),
                                    ),
                                    SizedBox(width: 10,),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(19),
                                      child: Container(
                                        height: 25, width: 150,
                                        color: Colors.green,
                                        child: Center(child: Text("Order Again",style: TextStyle(color: Colors.white),)),),
                                    ),

                                  ],
                                )
                              ],
                            ),

                          ),
                        )


                    ),
                  ],
                ),



              ),


            );



        }


        ),



      ),
    );

  }
}
void Dialog(BuildContext context){
  showDialog(context: context, builder: (context)
  {
    Timer(Duration(seconds: 5),()
    {
      Navigator.pop(context);
    }
    );
    return AlertDialog(
      title: Text("Remind me later"),
    );
  });
}