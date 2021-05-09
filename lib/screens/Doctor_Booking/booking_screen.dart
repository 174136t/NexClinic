import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/My_appointments/myAppintmentsHome_screen.dart';
import 'package:doctor_consultation_app/screens/detail_screen.dart';
import 'package:doctor_consultation_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spring/spring.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingScreen extends StatefulWidget {
  var _uid;
  var name;
  // var _description;
  // var _imageUrl;
  // var _bgColor;
  BookingScreen(this._uid, this.name);
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  CalendarController _controller;
  Color color = Colors.white;
  int checkedIndex1 = -1;
  int checkedIndex2 = -1;
  int checkedIndex3 = -1;
  String selectedDay = "";
  String selectedDate = "";
  List _selectedMorningIndexList = List();
  List _selectedMorningIndex = List();
  List _selectedAfternoonIndexList = List();
  List _selectedAfternoonIndex = List();
  List _selectedEveningIndexList = List();
  List _selectedEveningIndex = List();
  final _key = GlobalKey<SpringState>();
  final _key2 = GlobalKey<SpringState>();
  final _key3 = GlobalKey<SpringState>();

  @override
  void initState() {
    super.initState();
    getDocData(widget._uid);
    getPatientData();
    _controller = CalendarController();
    _selectedMorningIndexList.length = 0;
    _selectedAfternoonIndexList.length = 0;
    _selectedEveningIndexList.length = 0;
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
                      'Your Appointment has been scheduled',
                      style: TextStyle(
                          color: Colors.blue[800], fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                content: FadeAnimation(
                  1.2,
                  Text(
                    'You will be notified with a notification whether the doctor approves it or not',
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
                                Text('View my appointments',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MyAppointmentsHomeScreen(
                                          // widget._uid, widget.name
                                          ),
                                ),
                              );
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
                            child: Text('Back',
                                style: TextStyle(color: Colors.blue[800])),
                            onPressed: () {
                              Navigator.pop(context, true);
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

  showNoSelectWarningDialog(BuildContext context) {
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
                      'You haven\'t select any slot!',
                      style: TextStyle(
                          color: Colors.blue[800], fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                content: FadeAnimation(
                  1.2,
                  Text(
                    'Please select any time slot you want and try again',
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
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.blue[800])),
                            child: Text('Ok',
                                style: TextStyle(color: Colors.blue[800])),
                            onPressed: () {
                              Navigator.pop(context, true);
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

  Widget buildMorningCard(int index, int slot) {
    int start = 8;
    bool checked = index == checkedIndex1;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedMorningIndex.contains(index)) {
            _selectedMorningIndexList
                .removeWhere((element) => element["slot"] == index);
            _selectedMorningIndex.remove(index);
          } else {
            _selectedMorningIndex.add(index);
            _selectedMorningIndexList.add({"slot": index, "isBooked": 1});
          }
        });
        print("morning: $_selectedMorningIndexList");
        // if (checkedIndex1 == -1) {
        //   setState(() {
        //     checkedIndex1 = index;
        //      _selectedMorningIndexList.add(index);
        //   });
        // } else if (checkedIndex1 == index) {
        //   setState(() {
        //     checkedIndex1 = -1;
        //     _selectedMorningIndexList.remove(index);
        //   });
        // } else {
        //   setState(() {
        //     checkedIndex1 = index;
        //      _selectedMorningIndexList.add(index);
        //   });
        // }
        print("morning: $_selectedMorningIndex");
      },
      child: Stack(
        children: <Widget>[
          Card(
            color: _selectedMorningIndex.contains(index)
                ? Colors.deepPurple
                : Colors.white,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(12),
            // ),
            child: Container(
              child: Center(
                  child: Text(
                "${start + slot}.00 - ${start + 1 + slot}.00 ",
                style: TextStyle(
                    color: _selectedMorningIndex.contains(index)
                        ? Colors.white
                        : Colors.black),
              )),
            ),
          ),
          // Positioned(
          //   top: 12,
          //   right: 12,
          //   child: Offstage(
          //     offstage: !checked,
          //     child: Container(
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           border: Border.all(width: 2),
          //           shape: BoxShape.circle),
          //       child: Icon(
          //         Icons.check,
          //         color: Colors.blue,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildAfternoonCard(int index, int slot) {
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
            _selectedAfternoonIndexList.add({"slot": index, "isBooked": 1});
          }
        });
        print("afternoon :$_selectedAfternoonIndexList");
        // if (checkedIndex2 == -1) {
        //   setState(() {
        //     checkedIndex2 = index;
        //   });
        // } else if (checkedIndex2 == index) {
        //   setState(() {
        //     checkedIndex2 = -1;
        //   });
        // } else {
        //   setState(() {
        //     checkedIndex2 = index;
        //   });
        // }
        print("afternoon: $_selectedAfternoonIndex");
      },
      child: Stack(
        children: <Widget>[
          Card(
            color: _selectedAfternoonIndex.contains(index)
                ? Colors.deepPurple
                : Colors.white,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(12),
            // ),
            child: Container(
              child: Center(
                  child: Text("${start + slot}.00 - ${start + 1 + slot}.00 ",
                      style: TextStyle(
                          color: _selectedAfternoonIndex.contains(index)
                              ? Colors.white
                              : Colors.black))),
            ),
          ),
          // Positioned(
          //   top: 12,
          //   right: 12,
          //   child: Offstage(
          //     offstage: !checked,
          //     child: Container(
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           border: Border.all(width: 2),
          //           shape: BoxShape.circle),
          //       child: Icon(
          //         Icons.check,
          //         color: Colors.blue,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildEveningCard(int index, int slot) {
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
            _selectedEveningIndexList.add({"slot": index, "isBooked": 1});
          }
        });
        print("evening: $_selectedEveningIndexList");
        // if (checkedIndex3 == -1) {
        //   setState(() {
        //     checkedIndex3 = index;
        //   });
        // } else if (checkedIndex3 == index) {
        //   setState(() {
        //     checkedIndex3 = -1;
        //   });
        // } else {
        //   setState(() {
        //     checkedIndex3 = index;
        //   });
        // }
        print("evening: $_selectedEveningIndex");
      },
      child: Stack(
        children: <Widget>[
          Card(
            color: _selectedEveningIndex.contains(index)
                ? Colors.deepPurple
                : Colors.white,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(12),
            // ),
            child: Container(
              child: Center(
                  child: Text("${start + slot}.00 - ${start + 1 + slot}.00 ",
                      style: TextStyle(
                          color: _selectedEveningIndex.contains(index)
                              ? Colors.white
                              : Colors.black))),
            ),
          ),
          // Positioned(
          //   top: 12,
          //   right: 12,
          //   child: Offstage(
          //     offstage: !checked,
          //     child: Container(
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           border: Border.all(width: 2),
          //           shape: BoxShape.circle),
          //       child: Icon(
          //         Icons.check,
          //         color: Colors.blue,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  String pId = "";
  String pName = "";
  getPatientData() async {
   
   
    Firestore.instance
            .collection('users')
            .document((await FirebaseAuth.instance.currentUser()).uid)
            .get()
            .then((value) {
          setState(() {
            pId = value.data['uid'].toString();
            pName = value.data['firstname']+" "+ value.data['lastname'].toString();
             print('99999999999999999999999999');
    print(pId);
    print(pName);
    print('99999999999999999999999999');
          });
        });
    // for (int i = 0; i < list.length; i++) {
    // Firestore.instance
    //     .collection('users')
    //     .where('uid',
    //         isEqualTo: (await FirebaseAuth.instance.currentUser()).uid)
    //     .getDocuments()
    //     .then((snapshot) {
    //   print(snapshot.documents);
    //   // snapshot.documents.map((e) {
    //   //   if (!map1.containsKey(e.data['firstname'])) {
    //   //     map1[e.data['firstname']] = 1;
    //   //   } else {
    //   //     map1[e.data['firstname']] += 1;
    //   //   }
    //   //   // pNameList1.add(e.data["firstname"] + " " + e.data["lastname"]);
    //   // }).toList();
    //   // setState(() {
    //   //   print(map1);
    //   //   print(pNameList1);
    //   // });
    //   setState(() {
    //     // pNameList = snapshot.documents;
    //     // print('user $i :${pNameList[0]["firstname"]}');

    //     // print(pNameList1[i]);
    //     // pNameList1
    //     //     .add(pNameList[0]["firstname"] + " " + pNameList[0]["lastname"]);
    //     // print("haha $pNameList1");
    //   });
    // });
    // // }
    // hasData = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: purpleGradient),
        ),
        title: Text(
          'Apppointment',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => DetailScreen(
              //           widget.name,
              //           'Heart Surgeon - Flower Hospitals',
              //           'assets/images/doctor1.png',
              //           widget._uid)),
              // );
              Navigator.pop(context);
            }),
      ),
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: TableCalendar(
                initialCalendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                    todayColor: Colors.blue,
                    selectedColor: Theme.of(context).primaryColor,
                    todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.white)),
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  formatButtonTextStyle: TextStyle(color: Colors.white),
                  formatButtonShowsNext: false,
                ),
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: (date, events) {
                  print(date);
                  print(date.weekday);
                  setState(() {
                    selectedDate = date.toUtc().toString().substring(0, 10);
                    print(selectedDate);
                  });
                  if (date.weekday == 1) {
                    setState(() {
                      selectedDay = "Monday";
                      _selectedAfternoonIndexList.clear();
                      _selectedEveningIndex.clear();
                      _selectedAfternoonIndex.clear();
                      _selectedMorningIndex.clear();
                      _selectedMorningIndexList.clear();
                      _selectedEveningIndexList.clear();
                    });
                  } else if (date.weekday == 2) {
                    setState(() {
                      selectedDay = "Tuesday";
                      _selectedAfternoonIndexList.clear();
                      _selectedEveningIndex.clear();
                      _selectedAfternoonIndex.clear();
                      _selectedMorningIndex.clear();
                      _selectedMorningIndexList.clear();
                      _selectedEveningIndexList.clear();
                    });
                  } else if (date.weekday == 3) {
                    setState(() {
                      selectedDay = "Wednesday";
                      _selectedAfternoonIndexList.clear();
                      _selectedEveningIndex.clear();
                      _selectedAfternoonIndex.clear();
                      _selectedMorningIndex.clear();
                      _selectedMorningIndexList.clear();
                      _selectedEveningIndexList.clear();
                    });
                  } else if (date.weekday == 4) {
                    setState(() {
                      selectedDay = "Thursday";
                      _selectedAfternoonIndexList.clear();
                      _selectedEveningIndex.clear();
                      _selectedAfternoonIndex.clear();
                      _selectedMorningIndex.clear();
                      _selectedMorningIndexList.clear();
                      _selectedEveningIndexList.clear();
                    });
                  } else if (date.weekday == 5) {
                    setState(() {
                      selectedDay = "Friday";
                      _selectedAfternoonIndexList.clear();
                      _selectedEveningIndex.clear();
                      _selectedAfternoonIndex.clear();
                      _selectedMorningIndex.clear();
                      _selectedMorningIndexList.clear();
                      _selectedEveningIndexList.clear();
                    });
                  } else if (date.weekday == 6) {
                    setState(() {
                      selectedDay = "Saturday";
                      _selectedAfternoonIndexList.clear();
                      _selectedEveningIndex.clear();
                      _selectedAfternoonIndex.clear();
                      _selectedMorningIndex.clear();
                      _selectedMorningIndexList.clear();
                      _selectedEveningIndexList.clear();
                    });
                  } else {
                    setState(() {
                      selectedDay = "Sunday";
                      _selectedAfternoonIndexList.clear();
                      _selectedEveningIndex.clear();
                      _selectedAfternoonIndex.clear();
                      _selectedMorningIndex.clear();
                      _selectedMorningIndexList.clear();
                      _selectedEveningIndexList.clear();
                    });
                  }
                },
                builders: CalendarBuilders(
                  selectedDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                  todayDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                calendarController: _controller,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Available Slots',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue[800]),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Morning Slots',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    StreamBuilder(
                        stream: Firestore.instance
                            .collection('freetimeslots')
                            .document(widget._uid)
                            .collection(selectedDay)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!(snapshot.hasData)) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SpinKitFadingFour(
                                  color: Colors.blue,
                                ),
                                Spring(
                                    key: _key3,
                                    motion: Motion.Mirror,
                                    animType: AnimType.Bubble,
                                    animStatus: (status) {},
                                    animDuration: Duration(seconds: 5),
                                    child: Text("Select a day from calender")),
                              ],
                            );
                          } else {
                            // print(snapshot.data.documents.runtimeType);

                            List<DocumentSnapshot> docData =
                                snapshot.data.documents;
                            // print('gggg');
                            print(' gg hu ${docData.length}');
                            // print('gggg');

                            if (docData.length == 0 ||
                                docData[0]['morning'].length == 0) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SpinKitRotatingCircle(
                                    color: Colors.blue,
                                  ),
                                  Text("No slots Available!!!"),
                                ],
                              );
                            } else {
                              return GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: docData[0]['morning'].length,
                                  // snapshot
                                  //     .data.documents.length, //data.length,
                                  gridDelegate:
                                      new SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio:
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.2 /
                                                      1),
                                          crossAxisCount: 3),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // print(docData[0]['morning'].length);
                                    // print('vvvvvvvvvvvvvv');
                                    // print(docData[0]['morning'][index]
                                    //     .toString());
                                    // print('vvvvvvvvvvvvvv');

                                    return buildMorningCard(index,
                                        docData[0]['morning'][index]['slot']);
                                  });
                            }
                          }
                        }),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Afternoon Slots',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    StreamBuilder(
                        stream: Firestore.instance
                            .collection('freetimeslots')
                            .document(widget._uid)
                            .collection(selectedDay)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!(snapshot.hasData)) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SpinKitFadingFour(
                                  color: Colors.blue,
                                ),
                                Spring(
                                    key: _key2,
                                    motion: Motion.Mirror,
                                    animType: AnimType.Bubble,
                                    animStatus: (status) {},
                                    animDuration: Duration(seconds: 5),
                                    child: Text("Select a day from calender")),
                              ],
                            );
                          } else {
                            // print(snapshot.data.documents.runtimeType);

                            List<DocumentSnapshot> docData =
                                snapshot.data.documents;
                            // print('gggg');
                            // print(docData[0]['afternoon'].length);
                            // print('gggg');
                            if (docData.length == 0 ||
                                docData[0]['afternoon'].length == 0) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SpinKitRotatingCircle(
                                    color: Colors.blue,
                                  ),
                                  Text("No slots Available!!!"),
                                ],
                              );
                            } else {
                              return GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: docData[0]['afternoon']
                                      .length, //data.length,
                                  gridDelegate:
                                      new SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio:
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.2 /
                                                      1),
                                          crossAxisCount: 3),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return buildAfternoonCard(index,
                                        docData[0]['afternoon'][index]['slot']);
                                  });
                            }
                          }
                        }),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Evening Slots',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    StreamBuilder(
                        stream: Firestore.instance
                            .collection('freetimeslots')
                            .document(widget._uid)
                            .collection(selectedDay)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!(snapshot.hasData)) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SpinKitFadingFour(
                                  color: Colors.blue,
                                ),
                                Spring(
                                    key: _key,
                                    motion: Motion.Mirror,
                                    animType: AnimType.Bubble,
                                    animStatus: (status) {},
                                    animDuration: Duration(seconds: 5),
                                    child: Text("Select a day from calender")),
                              ],
                            );
                          } else {
                            // print(snapshot.data.documents.runtimeType);

                            List<DocumentSnapshot> docData =
                                snapshot.data.documents;
                            // print('gggg');
                            // print(docData[0]['evening']);
                            // print('gggg');
                            if (docData.length == 0 ||
                                docData[0]['evening'].length == 0) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SpinKitRotatingCircle(
                                    color: Colors.blue,
                                  ),
                                  Text("No slots Available!!!"),
                                ],
                              );
                            } else {
                              return GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: docData[0]['evening']
                                      .length, //data.length,
                                  gridDelegate:
                                      new SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio:
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.2 /
                                                      1),
                                          crossAxisCount: 3),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return buildEveningCard(index,
                                        docData[0]['evening'][index]['slot']);
                                  });
                            }
                          }
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blue[800],
          onPressed: () async {
            if ((_selectedMorningIndexList.length != 0) ||
                (_selectedAfternoonIndexList.length != 0) ||
                (_selectedEveningIndexList.length != 0)) {
              try {
                Firestore.instance
                    .collection('bookingslots')
                    .document((await FirebaseAuth.instance.currentUser())
                        .uid) // client uid
                    .collection((await FirebaseAuth.instance.currentUser()).uid)
                    .document() // client uid
                    .setData({
                  'docId': widget._uid,
                  'docName': docName,
                  'speciality': speciality,
                  'date': selectedDate,
                  'morning': _selectedMorningIndexList,
                  'afternoon': _selectedAfternoonIndexList,
                  'evening': _selectedEveningIndexList
                });
                Firestore.instance
                    .collection('doctorwisebooking')
                    .document(widget._uid) // doctor uid
                    .collection('bookinfo')
                    .document()
                    .setData({
                  'docId': widget._uid,
                  'docName': docName,
                  'speciality': speciality,
                  'patientId': (await FirebaseAuth.instance.currentUser()).uid,
                  'patientName': pName,
                  'date': selectedDate,
                  'morning': _selectedMorningIndexList,
                  'afternoon': _selectedAfternoonIndexList,
                  'evening': _selectedEveningIndexList
                });
                // print('lllllllllllll');
                // print(_selectedAfternoonIndexList.length);
                // print(_selectedMorningIndexList.length);
                // print(_selectedEveningIndexList.length);
                // print('lllllllllllll');
                showWarningDialog(context);
                setState(() {
                  _selectedAfternoonIndexList.clear();
                  _selectedEveningIndex.clear();
                  _selectedAfternoonIndex.clear();
                  _selectedMorningIndex.clear();
                  _selectedMorningIndexList.clear();
                  _selectedEveningIndexList.clear();
                });
              } catch (e) {
                print(e);
              }
            } else {
              showNoSelectWarningDialog(context);
            }
          },
          label: Text(
            "Confirm Appointment",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  String docName = "";
  String speciality = "";
  Future<void> getDocData(String idno) async {
    var documentList;

    documentList = await Firestore.instance
        .collection('doctors')
        .where("uid", isEqualTo: idno)
        .getDocuments();
    final List<DocumentSnapshot> documents = documentList.documents;
    setState(() {
      docName = documents.first.data['firstname'] +
          " " +
          documents.first.data['lastname'];
      speciality = documents.first.data['speciality'];
    });
  }
}
