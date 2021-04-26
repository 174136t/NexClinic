import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PendingList extends StatefulWidget {
  final String pid;
  PendingList(this.pid);
  @override
  _PendingListState createState() => _PendingListState();
}

class _PendingListState extends State<PendingList> {
  int checkedIndex3 = -1;
  String updateTimeZone;
  List<dynamic> list;
  Widget buildUpcomingCard(
      int index,
      String date,
      int time,
      String name,
      String type,
      int start,
      String unit,
      String documentId,
      String timezone,
      int arrIndex) {
    // bool checked = index == checkedIndex3;
    int begin = time + start;
    int end = time + start + 1;
    return GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  // color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(date)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Time($unit)',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w900),
                            ),
                            Text("$begin.00 - $end.00")
                          ],
                        ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       'Doctor',
                        //       style: TextStyle(
                        //           color: Colors.grey[600],
                        //           fontWeight: FontWeight.w900),
                        //     ),
                        //     Text(name)
                        //   ],
                        // )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       'Booking For',
                        //       style: TextStyle(
                        //           color: Colors.grey[600],
                        //           fontWeight: FontWeight.w900),
                        //     ),
                        //     Text(type)
                        //   ],
                        // ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showPendingDialog(context);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                  color: Colors.green[600],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    "Accept",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showCancelDialog(
                                      context, documentId, timezone, arrIndex);
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  decoration: BoxDecoration(
                                    color: Colors.red[600],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0.0, 1.0), //(x,y)
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                      "Reject",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                              )
                            ])
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  showPendingDialog(BuildContext context) {
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
                      'Your Appointment is pending',
                      style: TextStyle(
                          color: Colors.blue[800], fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                content: FadeAnimation(
                  1.2,
                  Text(
                    'When the doctor approves it this button will change to Approved',
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
                            "assets/images/pendingDoc.png",
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
                                Text('Ok',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                          ),
                        ),
                      ),
                      // FadeAnimation(
                      //   1.4,
                      //   Container(
                      //     width: MediaQuery.of(context).size.width * 0.8,
                      //     child: FlatButton(
                      //       color: Colors.white,
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(5.0),
                      //           side: BorderSide(color: Colors.blue[800])),
                      //       child: Text('Back to home',
                      //           style: TextStyle(color: Colors.blue[800])),
                      //       onPressed: () {
                      //         Navigator.pop(context, true);
                      //       },
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            )));
  }

  showCancelDialog(BuildContext context, String id, String timezone, int arr) {
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
                      'Are you sure you want to cancel this?',
                      style: TextStyle(
                          color: Colors.blue[800], fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                content: FadeAnimation(
                  1.2,
                  Text(
                    'Press ok button to cancel your appointment',
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
                            "assets/images/sadDoc.png",
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
                                Text('Ok',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            onPressed: () async {
                              print('preessssssss');
                              print([arr]);
                              print([arr][0]);
                              Firestore.instance
                                  .collection('bookingslots')
                                  .document(docID)
                                  .collection(docID)
                                  .document(id)
                                  .get()
                                  .then((DocumentSnapshot ds) {
                                list = List.from(ds.data['$timezone']);
                                print(list);
                                print(ds.data.toString());
                                list.removeAt([arr][0]);
                                print('new');
                                print(list);
                                print(timezone);
                                Firestore.instance
                                    .collection('bookingslots')
                                    .document(docID)
                                    .collection(docID)
                                    .document(id)
                                    .updateData({
                                  "$timezone": list
                                  // FieldValue.arrayRemove([arr]
                                  // )
                                });
                              });
                              Navigator.pop(context);
                              // Future<DocumentSnapshot> refff = ref.get();
                              // print(refff.da);
                              // setState(() {
                              //   if ([arr].toString() == "0") {
                              //     updateTimeZone = "morning";
                              //   } else if ([arr].toString() == "1") {
                              //     updateTimeZone = "afternoon";
                              //   } else if ([arr].toString() == "2") {
                              //     updateTimeZone = "evening";
                              //   }
                              // });
                              // print(updateTimeZone);
                              // await Firestore.instance
                              //     .collection('bookingslots')
                              //     .document(docID)
                              //     .collection(docID)
                              //     .document(id)
                              //     .updateData({
                              //   "$timezone": {FieldValue.arrayUnion(list)}
                              //   // FieldValue.arrayRemove([arr]
                              //   // )
                              // });
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

  String docID = '';
  String pid = '';
  String docName = "";
  String speciality = "";
  Future<void> getUser() async {
    FirebaseUser _user = await FirebaseAuth.instance.currentUser();
    setState(() {
      docID = _user.uid;
    });
  }

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

  @override
  void initState() {
    // TODO: implement initState
    getUser().then((value) {
      print('9999');
      print(docID);
      print('9999');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('bookingslots')
            .document(widget.pid)
            .collection(widget.pid)
            .snapshots(),
        builder: (context, snapshot) {
          if ((!(snapshot.hasData)) || snapshot.data.documents.length == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitFadingFour(
                  color: Colors.blue,
                ),
                Text("No appointmnets"),
              ],
            );
          } else {
            List<DocumentSnapshot> bookData = snapshot.data.documents;
            // print(bookData[0]['morning'].length);
            getDocData(bookData[0]["docId"]);
            // print(bookData[0].documentID);
            return new ListView.builder(
                shrinkWrap: true,
                itemCount: bookData.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  // if(bookData[index]['morning'] != null){
                  return Column(
                    children: [
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: bookData[index]['morning'].length,
                          itemBuilder: (BuildContext context1, int index1) {
                            return bookData[index]['morning'][index1]
                                        ['isBooked'] !=
                                    2
                                ? buildUpcomingCard(
                                    index1,
                                    bookData[index]['date'],
                                    bookData[index]['morning'][index1]['slot'],
                                    docName,
                                    speciality,
                                    8,
                                    "am",
                                    bookData[index].documentID,
                                    'morning',
                                    index1)
                                : Container();
                          }),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: bookData[index]['afternoon'].length,
                          itemBuilder: (BuildContext context1, int index1) {
                            return bookData[index]['afternoon'][index1]
                                        ['isBooked'] !=
                                    2
                                ? buildUpcomingCard(
                                    index1,
                                    bookData[index]['date'],
                                    bookData[index]['afternoon'][index1]
                                        ['slot'],
                                    docName,
                                    speciality,
                                    12,
                                    "pm",
                                    bookData[index].documentID,
                                    'afternoon',
                                    index1)
                                : Container();
                          }),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: bookData[index]['evening'].length,
                          itemBuilder: (BuildContext context1, int index1) {
                            return bookData[index]['evening'][index1]
                                        ['isBooked'] !=
                                    2
                                ? buildUpcomingCard(
                                    index1,
                                    bookData[index]['date'],
                                    bookData[index]['evening'][index1]['slot'],
                                    docName,
                                    speciality,
                                    16,
                                    "pm",
                                    bookData[index].documentID,
                                    "evening",
                                    index1)
                                : Container();
                          })
                    ],
                  );
                  // bookData[index]['morning'] != null
                  //     ? buildUpcomingCard(
                  //         index,
                  //         bookData[index]['date'],
                  //         bookData[index]['morning'][index]['slot'],
                  //         bookData[index]['docId'])
                  //     :bookData[index]['afternoon'] != null? buildUpcomingCard(
                  //         index,
                  //         bookData[index]['date'],
                  //         bookData[index]['afternoon'][index]['slot'],
                  //         bookData[index]['docId'])
                  //         :bookData[index]['evening'] != null?buildUpcomingCard(
                  //         index,
                  //         bookData[index]['date'],
                  //         bookData[index]['evening'][index]['slot'],
                  //         bookData[index]['docId']):Container();
                  // }
                });
          }
        },
      ),
    );
  }
}
