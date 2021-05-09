import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/screens/Consultant_Home/DoctorWise_Booking/accepted_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AcceptedPatientList extends StatefulWidget {
  @override
  _AcceptedPatientListState createState() => _AcceptedPatientListState();
}

class _AcceptedPatientListState extends State<AcceptedPatientList> {
  bool hasData = true;
  var map = Map();
  var map1 = Map();
  var list = List();
  var pNameList1 = List();
  List<DocumentSnapshot> pNameList;
  String docId = "";

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
          .then((snapshot) async {
        docId = (await FirebaseAuth.instance.currentUser()).uid;
        snapshot.documents.map((element) {
          if (!map.containsKey(element.data['patientId'])) {
            map[element.data['patientId']] = 1;
          } else {
            map[element.data['patientId']] += 1;
          }
          if (!map1.containsKey(element.data['patientName'])) {
            map1[element.data['patientName']] = 1;
          } else {
            map1[element.data['patientName']] += 1;
          }
        }).toList();
        setState(() {
          hasData = true;
          print('huhu $map');
          if (map.toString() == '{}') {
            hasData = false;
            print(hasData);
          } else {
            hasData = true;
          }
          print(map.keys);
          list = map.keys.toList();
          pNameList1 = map1.keys.toList();
          print('list 0: ${list[0]}');
          print('name list 0: ${pNameList1[0]}');
        });
        // getPatientData();
      });
    } catch (e) {
      setState(() {
        hasData = false;
      });
    }
  }

  // getPatientData() {
  //   for (int i = 0; i < list.length; i++) {
  //     Firestore.instance
  //         .collection('users')
  //         .where('uid', isEqualTo: list[i])
  //         .getDocuments()
  //         .then((snapshot) {
  //       // snapshot.documents.map((e) {
  //       //   if (!map1.containsKey(e.data['firstname'])) {
  //       //     map1[e.data['firstname']] = 1;
  //       //   } else {
  //       //     map1[e.data['firstname']] += 1;
  //       //   }
  //       //   // pNameList1.add(e.data["firstname"] + " " + e.data["lastname"]);
  //       // }).toList();
  //       // setState(() {
  //       //   print(map1);
  //       //   print(pNameList1);
  //       // });
  //       setState(() {
  //         pNameList = snapshot.documents;
  //         // print('user $i :${pNameList[0]["firstname"]}');
  //         pNameList1.insert(
  //             i, pNameList[0]["firstname"] + " " + pNameList[0]["lastname"]);
  //         // print(pNameList1[i]);
  //         // pNameList1
  //         //     .add(pNameList[0]["firstname"] + " " + pNameList[0]["lastname"]);
  //         // print("haha $pNameList1");
  //       });
  //     });
  //   }
  //   hasData = true;
  // }
  Widget _categoryThumbnail() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.005),
        alignment: FractionalOffset.centerLeft,
        child: CircleAvatar(
          radius: MediaQuery.of(context).size.height * 0.045,
          backgroundColor: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, color: Colors.grey[200], spreadRadius: 5)
              ],
            ),
            child: CircleAvatar(
                backgroundColor: Colors.deepPurple[100],
                radius: MediaQuery.of(context).size.height * 0.04,
                child: Image.asset(
                  'assets/images/dooct.png',
                )),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Container(
          child: list.isEmpty
              // hasData==false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitFadingFour(
                      color: Colors.blue,
                    ),
                    Text(hasData == true
                        ? 'Loading...'
                        : 'No accepted requests yet!')
                  ],
                )
              : ListView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return FadeAnimation(
                      1.1,
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AcceptedList(list[index], docId),
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
                                    margin:
                                        EdgeInsets.only(left: size.width * 0.1),
                                    width: width * 0.9,
                                    height: height * 0.1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey[200],
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: pNameList1.isNotEmpty
                                            ? Text(
                                                pNameList1[index],
                                                textAlign: TextAlign.left,
                                              )
                                            : Container()),
                                  ),
                                ),
                              ),
                              _categoryThumbnail()
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
        ));
  }
}
