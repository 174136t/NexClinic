import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import './call.dart';

class IndexPage extends StatefulWidget {
  final String docId;
  final String pId;
  IndexPage(this.docId, this.pId);
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();

  /// if channel textField is validated to have error
  bool _validateError = false;

  ClientRole _role = ClientRole.Broadcaster;

  Future<void> getCode() async {
    Firestore.instance
        .collection('videoCode')
        .document(widget.pId)
        .collection('bookinfo')
        .where('docId', isEqualTo: widget.docId)
        .getDocuments()
        .then((value) {
      setState(() {
        print("code is : ${value.documents.first.data['code']}");
        _channelController.text = value.documents.first.data['code'];
      });
    });
  }
 showStartingDialog(
    BuildContext context,
    // int index,
    // String date,
    // int time,
    // String name,
    // String type,
    // int start,
    // String unit,
    // String documentId,
    // String timezone,
    // int arrIndex
  ) {
    // int begin = time + start;
    // int end = time + start + 1;
    // List<dynamic> list;
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
                      'Join this meeting now?',
                      style: TextStyle(
                          color: Colors.blue[800], fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                content: FadeAnimation(
                  1.2,
                  Text(
                    'When you joins, the doctor will get notified.',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                  ),
                ),
                actions: <Widget>[
                  Column(
                    children: [
                      FadeAnimation(
                        1.3,
                        ClipRRect(
                          child: Image.asset(
                            "assets/images/video_start.png",
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
                                    Colors.blue,
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
                              onJoin();
                              // Navigator.pop(context, true);
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
  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   flexibleSpace: Container(
        //     decoration: BoxDecoration(gradient: purpleGradient),
        //   ),
        //   title: Text('Video Consultation'),
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 1.5,
            decoration: BoxDecoration(gradient: purpleGradient),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  // decoration: BoxDecoration(
                  //   gradient: purpleGradient
                  // ),
                  child: Center(
                      child: Text(
                    'Video Consultation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.w900),
                  )),
                ),
                FadeAnimation(
                  1.1,
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    // height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            "Press Join button to join the Video Consultation",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                          ClipRRect(
                            child: Image.asset(
                              "assets/images/dooct.png",
                              height: size.height * 0.3,
                              // width: double.infinity,
                              // it cover the 25% of total height
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              // Row(
                              //   children: <Widget>[
                              //     Expanded(
                              //         child: TextField(
                              //       controller: _channelController,
                              //       decoration: InputDecoration(
                              //         errorText: _validateError
                              //             ? 'Consultation code is mandatory'
                              //             : null,
                              //         border: UnderlineInputBorder(
                              //           borderSide: BorderSide(width: 1),
                              //         ),
                              //         hintText: 'Consultation code',
                              //       ),
                              //     ))
                              //   ],
                              // ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.05,
                                  ),
                                  ListTile(
                                    title: Text('Video & Audio'),
                                    subtitle: Text('Doctor can see you'),
                                    leading: Radio(
                                      value: ClientRole.Broadcaster,
                                      groupValue: _role,
                                      onChanged: (ClientRole value) {
                                        setState(() {
                                          _role = value;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text('Audio only'),
                                    subtitle: Text('Doctor can only hear you'),
                                    leading: Radio(
                                      value: ClientRole.Audience,
                                      groupValue: _role,
                                      onChanged: (ClientRole value) {
                                        setState(() {
                                          _role = value;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        getCode().whenComplete(() {
                                          showStartingDialog(context);
                                        });
                                      },
                                      child: Center(
                                        child: Container(
                                          width: 200,
                                          decoration: BoxDecoration(
                                              gradient: new LinearGradient(
                                                  colors: [
                                                    Colors.blue[800],
                                                    Colors.deepPurple,
                                                  ],
                                                  begin: const FractionalOffset(
                                                      0.0, 0.0),
                                                  end: const FractionalOffset(
                                                      1.0, 0.0),
                                                  stops: [0.0, 1.0],
                                                  tileMode: TileMode.clamp),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text('Join',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic();
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController.text,
            role: _role,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}
