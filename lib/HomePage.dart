import 'package:car_reading/ResultPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'info_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var readingController = new TextEditingController();
  var fuleController = new TextEditingController();
  var netController = new TextEditingController();
  var priceController = new TextEditingController();
  var placeController = new TextEditingController();
  var dateController = new TextEditingController();
  var timeController = new TextEditingController();

  List<info> infoList = [];

  DatabaseReference dbref = FirebaseDatabase.instance.ref();

  bool loading = false;



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Car Reading", style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.deepPurple.shade700,
      ),

      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/bg.png"),
            fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(

                padding: const EdgeInsets.only(top: 50.0, right: 10.0, left: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),

                  ),
                  child: TextField(
                    controller: readingController,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Enter The Reading in Kilometer",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      labelText: "Reading",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none
                      ),

                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20, left: 10, right: 10),
                child: Container(
                  child: TextField(
                      controller: dateController,
                      keyboardType: TextInputType.datetime,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Enter The Date",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        labelText: "Date",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide.none
                        ),

                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20, left: 10, right: 10),
                child: Container(
                  child: TextField(
                      controller: timeController,
                      keyboardType: TextInputType.datetime,
                      autofocus: true,
                      decoration: InputDecoration(

                        hintText: "Enter The Time",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        labelText: "Time",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide.none
                        ),

                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20, left: 10, right: 10),
                child: Container(
                  child: TextField(
                    controller: fuleController,
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Enter The Fule Type",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        labelText: "Fule Type",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide.none
                        ),

                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: TextField(
                  controller: netController,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "Fule NetQuantity Kg/Litter",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        labelText: "Fule Net",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide.none
                        )
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: TextField(
                  controller: priceController,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "Enter The Fule Cost",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        labelText: "Fule Cost",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide.none
                        )
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: TextField(
                  controller: placeController,
                    keyboardType: TextInputType.streetAddress,
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "Enter The Place",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        labelText: "Place",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide.none
                        )
                    )
                ),
              ),
              Padding(padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              child: Container(
                width: 300,
                height: 60,
                child: FilledButton(onPressed: () {
                  if(readingController.text.isNotEmpty &&
                      fuleController.text.isNotEmpty &&
                      netController.text.isNotEmpty &&
                      placeController.text.isNotEmpty &&
                      dateController.text.isNotEmpty &&
                      timeController.text.isNotEmpty
                  ){
                    insertData(
                        readingController.text,
                        fuleController.text,
                        netController.text,
                        priceController.text,
                        placeController.text,
                        dateController.text,
                        timeController.text,
                    );

                    Fluttertoast.showToast(
                      msg: 'Insert Data Successfully',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16
                    );

                    readingController.clear();
                    fuleController.clear();
                    netController.clear();
                    priceController.clear();
                    placeController.clear();
                    dateController.clear();
                    timeController.clear();
                  }else{
                    Fluttertoast.showToast(
                        msg: 'Fillup Data carefully',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16
                    );
                  }
                }, child: Text('Save', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
                  autofocus: true,
                ),
              ),),
              Padding(padding: const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 20),
                child: Container(
                  width: 300,
                  height: 60,
                  child: FilledButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage()));

                  }, child: Text('Show', style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                    autofocus: true,
                  ),
                ),),

            ],
          ),
        ),
      )
    ));
  }

  void insertData(String reading, String FuleType, String quantity, String Price, String Place, String date, String time){
    dbref.child("Info").push().set({
      'reading': reading,
      'type': FuleType,
      'quantity': quantity,
      'price': Price,
      'place': Place,
      'date': date,
      'time': time
    });
  }


}


