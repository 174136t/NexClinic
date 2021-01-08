import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/New_Login/new_otp_screen.dart';
import 'package:doctor_consultation_app/Widgets/curved_widget.dart';
import 'package:doctor_consultation_app/screens/Consultant_Home/consultant_home_screen.dart';
import 'package:doctor_consultation_app/screens/User_Type/userType_screen.dart';
import 'package:doctor_consultation_app/screens/home_screen.dart';
import 'package:doctor_consultation_app/screens/login_form_screen.dart';
import 'package:doctor_consultation_app/screens/onboarding_screen.dart';
import 'package:doctor_consultation_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  bool isValid = false;
  String type = "";

  Future<Null> validate(StateSetter updateState) async {
    print("in validate : ${_phoneNumberController.text.length}");
    if (_phoneNumberController.text.length == 9) {
      // 9 karanna
      updateState(() {
        isValid = true;
      });
    } else {
      updateState(() {
        isValid = false;
      });
    }
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
                      'User doesn\'t exist',
                      style: TextStyle(
                          color: Colors.blue[800], fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                content: FadeAnimation(
                  1.2,
                  Text(
                    'Check your number & try again',
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
                              // Navigator.push
                              Navigator.pop(context);
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         MyAppointmentsHomeScreen(),
                              //   ),
                              // );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: CurvedWidget(
                child: Container(
                  padding: const EdgeInsets.only(top: 70, left: 50),
                  width: double.infinity,
                  height: size.height * 0.7,
                  decoration: BoxDecoration(gradient: purpleGradient),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeAnimation(
                        1.3,
                        ClipRRect(
                          child: Image.asset(
                            "assets/images/dooct.png",
                            height: size.height * 0.35,
                            // width: double.infinity,
                            // it cover the 25% of total height
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      FadeAnimation(
                        1.4,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'NexClinic',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "The Best E-Consultant Solution",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 42,
            ),
            FadeAnimation(
              1.6,
              Container(
                width: size.width * 0.5,
                height: size.height * 0.058,
                child: OutlineButton(
                  borderSide: BorderSide(
                      color: Colors.blue[800],
                      style: BorderStyle.solid,
                      width: 3),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => LoginForm(),
                    //   ),
                    // );
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext bc) {
                          print("VALID CC: $isValid");

                          return StatefulBuilder(builder:
                              (BuildContext context, StateSetter state) {
                            return Container(
                              padding: EdgeInsets.all(16),
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'SIGNIN',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.red),
                                  ),
                                  Text(
                                    'Verify & continue to your HomeScreen',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _phoneNumberController,
                                      autofocus: true,
                                      onChanged: (text) {
                                        validate(state);
                                      },
                                      decoration: InputDecoration(
                                        hintText: '760123456',
                                        labelText: "9 digit mobile number",
                                        labelStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800),
                                        prefix: Container(
                                          padding: EdgeInsets.all(4.0),
                                          child: Text(
                                            "+94", // +94
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      autovalidateMode: AutovalidateMode.always,
                                      autocorrect: false,
                                      maxLengthEnforced: true,
                                      validator: (value) {
                                        return !isValid
                                            ? 'Please provide the valid phone number you used when registering'
                                            : null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    child: Center(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.85,
                                        child: RaisedButton(
                                          color: !isValid
                                              ? Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.5)
                                              : Theme.of(context).primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(0.0)),
                                          child: Text(
                                            !isValid
                                                ? "ENTER PHONE NUMBER"
                                                : "CONTINUE",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () async {
                                            if (isValid) {
                                              var documentList;
                                              bool isOk = false;
                                              try {
                                                documentList = await Firestore
                                                    .instance
                                                    .collection("users")
                                                    .where("phone",
                                                        isEqualTo:
                                                            _phoneNumberController
                                                                .text)
                                                    .getDocuments();
                                                //     .then((querySnapshot) {
                                                //   querySnapshot.documents
                                                //       .forEach((element) {
                                                //     if (element.exists) {
                                                //       print(element
                                                //           .data['usertype']);
                                                //       setState(() {
                                                //         type = element
                                                //             .data['usertype'];

                                                //         if (type != null) {
                                                //           Navigator.push(
                                                //               context,
                                                //               MaterialPageRoute(
                                                //                 builder: (context) => OTPScreen(
                                                //                     mobileNumber:
                                                //                         _phoneNumberController
                                                //                             .text,
                                                //                     type: type),
                                                //               ));
                                                //         } else if (type == "") {
                                                //           showWarningDialog(
                                                //               context);
                                                //         }
                                                //       });
                                                //     } else if (!element
                                                //         .exists) {
                                                //       print("error");
                                                //     }
                                                //   });
                                                // }).catchError((onError) {
                                                //   print("error yako $onError");
                                                // });
                                                // documentList
                                                //     .forEach((res) {
                                                //         print('yyyyyyyyyyyyyyyy');
                                                //     print(res.data());

                                                // // print(documentList.documents.first);
                                                // print('yyyyyyyyyyyyyyyy');
                                                //     });
                                                print('bbbbbbbbb');
                                                final List<DocumentSnapshot>
                                                    documents =
                                                    documentList.documents;
                                                print(documents
                                                    .first.data['usertype']);
                                                setState(() {
                                                  type = documents
                                                      .first.data['usertype'];
                                                });
                                                print('bbbbbbbbb');
                                                if (type != null) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            OTPScreen(
                                                                mobileNumber:
                                                                    _phoneNumberController
                                                                        .text,
                                                                type: type),
                                                      ));
                                                }
                                              } catch (e) {
                                                print("error $e");
                                                print(e);
                                                print('eeeeeeeeeeeeeeeeeerrr');
                                                showWarningDialog(context);
                                              }
                                            } else {
                                              validate(state);
                                            }
                                          },
                                          padding: EdgeInsets.all(16.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                        });
                  },
                  // color: Color(0xffFC9535),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: size.height * 0.025,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            FadeAnimation(
              1.7,
              Container(
                height: size.height * 0.06,
                width: size.width * 0.5,
                decoration: BoxDecoration(
                  // gradient: redGradient,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: MaterialButton(
                  color: Colors.blue[800],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserTypeScreen(),
                      ),
                    );
                  },
                  // color: Color(0xffFC9535),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: size.height * 0.025,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            FadeAnimation(
              1.8,
              Align(
                alignment: Alignment.bottomCenter,
                child: Text("NexClinic V.1.0"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
