import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation_app/screens/Consultant_Home/DoctorWise_Booking/pending_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PatientList extends StatefulWidget {
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  bool hasData;
  var map = Map();
  var map1 = Map();
  var list = List();
  var pNameList1 = List();
  List<DocumentSnapshot> pNameList;

  @override
  void initState() {
    // TODO: implement initState
    countNames();
    super.initState();
  }

  countNames() async {
    try {
      Firestore.instance
          .collection("doctorwisebooking")
          .document((await FirebaseAuth.instance.currentUser()).uid)
          .collection("bookinfo")
          .getDocuments()
          .then((snapshot) {
        snapshot.documents.map((element) {
          if (!map.containsKey(element.data['patientId'])) {
            map[element.data['patientId']] = 1;
          } else {
            map[element.data['patientId']] += 1;
          }
        }).toList();
        setState(() {
          // hasData = true;
          print('huhu $map');
          if (map.toString() == '{}') {
            hasData = false;
            print(hasData);
          } else {
            hasData = true;
          }
          print(map.keys);
          list = map.keys.toList();
          // print('list 0: ${list[0]}');
        });
        getPatientData();
      });
    } catch (e) {
      setState(() {
        hasData = false;
      });
    }
  }

  getPatientData() {
    for (int i = 0; i < list.length; i++) {
      Firestore.instance
          .collection('users')
          .where('uid', isEqualTo: list[i])
          .getDocuments()
          .then((snapshot) {
        // snapshot.documents.map((e) {
        //   if (!map1.containsKey(e.data['firstname'])) {
        //     map1[e.data['firstname']] = 1;
        //   } else {
        //     map1[e.data['firstname']] += 1;
        //   }
        //   // pNameList1.add(e.data["firstname"] + " " + e.data["lastname"]);
        // }).toList();
        // setState(() {
        //   print(map1);
        //   print(pNameList1);
        // });
        setState(() {
          pNameList = snapshot.documents;
          print('user $i :${pNameList[0]["firstname"]}');
          pNameList1.insert(
              i, pNameList[0]["firstname"] + " " + pNameList[0]["lastname"]);
          // print(pNameList[0].data);
          // pNameList1
          //     .add(pNameList[0]["firstname"] + " " + pNameList[0]["lastname"]);
          // print("haha $pNameList1");
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
        body: Container(
      child: pNameList1.length == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitFadingFour(
                  color: Colors.blue,
                ),
                Text(hasData == true
                    ? 'Loading...'
                    : 'No pending requests yet!')
              ],
            )
          : ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PendingList(list[index]),
                      ),
                    );
                  },
                  child: Container(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Container(
                              width: width * 0.9,
                              height: height * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.blue[50]),
                              child: Center(child: Text(pNameList1[index])),
                            ),
                          ),
                        )
                        // _categoryThumbnail()
                      ],
                    ),
                  ),
                );
              }),
    ));
  }
}
