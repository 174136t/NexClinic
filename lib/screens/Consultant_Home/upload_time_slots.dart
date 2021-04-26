import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/models/free_time_slots.dart';
import 'package:doctor_consultation_app/screens/Consultant_Home/consultant_home_screen.dart';
import 'package:doctor_consultation_app/screens/Consultant_Home/time_allocation_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UploadTimeSlots extends StatefulWidget {
  final String day;

  const UploadTimeSlots({Key key, this.day}) : super(key: key);

  @override
  _UploadTimeSlotsState createState() => _UploadTimeSlotsState();
}

class _UploadTimeSlotsState extends State<UploadTimeSlots> {
  int checkedIndex1 = -1;
  List _selectedEveningIndexList = List();
  List _selectedEveningIndex = List();
  List _selectedAfternoonIndexList = List();
  List _selectedAfternoonIndex = List();
  List _selectedMorningIndexList = List();
  List _selectedMorningIndex = List();

  Widget buildMorningCard(int index) {
    int start = 8;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedMorningIndex.contains(index)) {
            _selectedMorningIndexList
                .removeWhere((element) => element["slot"] == index);
            _selectedMorningIndex.remove(index);
          } else {
            _selectedMorningIndex.add(index);
            _selectedMorningIndexList.add({"slot": index, "isBooked": 0});
          }
        });
        print("morning: $_selectedMorningIndexList");
      },
      child: Stack(
        children: <Widget>[
          Card(
            color: _selectedMorningIndex.contains(index)
                ? Colors.blue[200]
                : Colors.white,
            child: Container(
              child: Center(
                  child: Text(
                "${start + index}.00 - ${start + 1 + index}.00 ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _selectedMorningIndex.contains(index)
                        ? Colors.white
                        : Colors.black),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAfternoonCard(int index) {
    int start = 12;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedAfternoonIndex.contains(index)) {
            _selectedAfternoonIndexList
                .removeWhere((element) => element["slot"] == index);
            _selectedAfternoonIndex.remove(index);
          } else {
            _selectedAfternoonIndex.add(index);
            _selectedAfternoonIndexList.add({"slot": index, "isBooked": 0});
          }
        });
        print("afternoon :$_selectedAfternoonIndexList");
      },
      child: Stack(
        children: <Widget>[
          Card(
            color: _selectedAfternoonIndex.contains(index)
                ? Colors.blue[200]
                : Colors.white,
            child: Container(
              child: Center(
                  child: Text("${start + index}.00 - ${start + 1 + index}.00 ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _selectedAfternoonIndex.contains(index)
                              ? Colors.white
                              : Colors.black))),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEveningCard(int index) {
    int start = 16;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedEveningIndex.contains(index)) {
            _selectedEveningIndexList
                .removeWhere((element) => element["slot"] == index);
            _selectedEveningIndex.remove(index);
          } else {
            _selectedEveningIndex.add(index);
            _selectedEveningIndexList.add({"slot": index, "isBooked": 0});
          }
        });
        print("evening: $_selectedEveningIndexList");
      },
      child: Stack(
        children: <Widget>[
          Card(
            color: _selectedEveningIndex.contains(index)
                ? Colors.blue[200]
                : Colors.white,
            child: Container(
              child: Center(
                  child: Text(
                "${start + index}.00 - ${start + 1 + index}.00 ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _selectedEveningIndex.contains(index)
                        ? Colors.white
                        : Colors.black),
              )),
            ),
          ),
        ],
      ),
    );
  }

  showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => new Theme(
            data: Theme.of(context).copyWith(
                dialogBackgroundColor: Colors.white,
                backgroundColor: Colors.white),
            child: Container(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                title: FadeAnimation(
                  1.1,
                  Center(
                    child: Text(
                      'Your ${widget.day} free slots have been updated',
                      style: TextStyle(
                          color: Colors.blue[800], fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                content: FadeAnimation(
                  1.2,
                  Text(
                    'Your patients will choose their time slot by looking at this',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                actions: <Widget>[
                  Column(
                    children: [
                      FadeAnimation(
                        1.3,
                        ClipRRect(
                          child: Image.asset(
                            "assets/images/dooct.png",
                            height: MediaQuery.of(context).size.height * 0.35,
                            // width: double.infinity,
                            // it cover the 25% of total height
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      FadeAnimation(
                        1.4,
                        Container(
                          decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: [
                                    const Color(0xFF3366FF),
                                    Colors.deepPurple,
                                  ],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(1.0, 0.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                              borderRadius: BorderRadius.circular(5.0)),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              // side: BorderSide(color: Colors.indigo)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('ok',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                          ),
                        ),
                      ),
                      FadeAnimation(
                        1.4,
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.blue[800])),
                            child: Text('Back to home',
                                style: TextStyle(color: Colors.blue[800])),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ConsultantHomeScreen(''),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.1,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: purpleGradient,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Select & upload your free time slots",
                        style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "(You can change this at any time)",
                        style: TextStyle(
                            fontSize: size.height * 0.015,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                '${widget.day}-Morning Slots (a.m.)',
                style: TextStyle(
                    fontSize: size.height * 0.018, fontWeight: FontWeight.w600),
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 4, //data.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height * 0.2 / 1),
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return buildMorningCard(index);
                  }),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                '${widget.day}-Afternoon Slots (p.m.)',
                style: TextStyle(
                    fontSize: size.height * 0.018, fontWeight: FontWeight.w600),
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 4, //data.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height * 0.2 / 1),
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return buildAfternoonCard(index);
                  }),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                '${widget.day}-Evening Slots (p.m.)',
                style: TextStyle(
                    fontSize: size.height * 0.018, fontWeight: FontWeight.w600),
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 4, //data.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height * 0.2 / 1),
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return buildEveningCard(index);
                  }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.blue[800],
            onPressed: () async {
              try {
                Firestore.instance
                    .collection('freetimeslots')
                    .document((await FirebaseAuth.instance.currentUser()).uid)
                    .collection('${widget.day}')
                    .document((await FirebaseAuth.instance.currentUser()).uid)
                    .setData({
                  'morning': _selectedMorningIndexList,
                  'afternoon': _selectedAfternoonIndexList,
                  'evening': _selectedEveningIndexList
                });
                showWarningDialog(context);
              } catch (e) {
                print(e);
              }
            },
            label: Text(
              "Save & Upload",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      ),
    );
  }
}
