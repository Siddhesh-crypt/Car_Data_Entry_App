import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'info_model.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  List<info> infoList = [];

  DatabaseReference dbref = FirebaseDatabase.instance.ref();

  @override
  void initState(){
    super.initState();

    retriveInfodata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Car Reading",
        style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.deepPurple.shade700,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("image/bg.png"),
              fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for(int i = 0; i < infoList.length; i++)
                infoWidget(infoList[i])
            ],
          ),
        ),
      ),
    ));
  }

  void retriveInfodata() {
    dbref.child("Info").onChildAdded.listen((data) {
      InfoData infoData = InfoData.fromJson(data.snapshot.value as Map);
      info Info = info(key: data.snapshot.key, infoData: infoData);
      infoList.add(Info);
      setState(() {

      });
    });
  }

  Widget infoWidget(info infoList) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(

        color: Colors.white70,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black,width: 3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Entry", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey.shade700
              ),),
              Text("Fule Type", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text("Fule Quantity", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text("price", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text("Place", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text("Date", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text("Time", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("------>", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text("------>", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text("------>", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text("------>", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text("------>", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text("------>", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text("------>", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),

            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(infoList.infoData!.reading!, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text(infoList.infoData!.fule_type!, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text(infoList.infoData!.quantity!, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text(infoList.infoData!.price!, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text(infoList.infoData!.place!, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text(infoList.infoData!.date!, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade700
              ),),
              Text(infoList.infoData!.time!, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey.shade700
              ),)


            ],
          ),
        ],
      ),
    );
  }
  
}
