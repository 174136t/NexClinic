import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/Consultant_Home/consultant_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatefulWidget {
  final String mobileNumber;
  final String firstname;
  final String lastname;
  final String email;
  final String address;
  final String nic;
  final String speciality;

  const OnboardScreen(
      {Key key,
      this.mobileNumber,
      this.firstname,
      this.lastname,
      this.email,
      this.address,
      this.nic,
      this.speciality})
      : super(key: key);
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _register() async {
    try {
      final FirebaseUser user = (await _auth.currentUser(
          // email: widget.email,
          // password: '',
          ));
      // .user;
      if (user != null) {
        print('doctor adding!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        await Firestore.instance
            .collection('doctors')
            .document(user.uid)
            .setData({
          'firstname': widget.firstname,
          'lastname': widget.lastname,
          'email': widget.email,
          'address': widget.address,
          'uid':user.uid,
          'nic': widget.nic,
          'phone': widget.mobileNumber,
          'speciality': widget.speciality,
          'usertype': "doctor",
        });
        print("${widget.firstname}");
        print('doctor added!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        // showWarningDialog(context);
        // setState(() {
        //   _success = true;
        //   _userEmail = user.email;
        // });
      }
    } catch (ex) {
      print(ex);
      // showErrorDialog(context);
      // setState(() {
      //   _success = true;
      // });
    }
  }

  void _register1() async {
    try {
      final FirebaseUser user = (await _auth.currentUser(
          // email: widget.email,
          // password: '',
          ));
      // .user;
      if (user != null) {
        print('doctor adding!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        await Firestore.instance
            .collection('users')
            .document(user.uid)
            .setData({
          'firstname': widget.firstname,
          'lastname': widget.lastname,
          'email': widget.email,
          'address': widget.address,
          'uid':user.uid,
          'nic': widget.nic,
          'phone': widget.mobileNumber,
          'speciality': widget.speciality,
          'usertype': "doctor",
        });
        print("${widget.firstname}");
        print('doctor added!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        // showWarningDialog(context);
        // setState(() {
        //   _success = true;
        //   _userEmail = user.email;
        // });
      }
    } catch (ex) {
      print(ex);
      // showErrorDialog(context);
      // setState(() {
      //   _success = true;
      // });
    }
  }

  void initState() {
    super.initState();
    // _register();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            decoration: BoxDecoration(
              gradient: purpleGradient,
            ),
            child: SafeArea(
              bottom: false,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: Image.asset(
                      "assets/images/login_bottom.png",
                      width: size.width * 0.5,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      FadeAnimation(
                        1.3,
                        Align(
                            alignment: Alignment.topCenter,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              child: Image.asset(
                                "assets/images/llll.jpg",
                                //height: size.height * 0.35,
                                width: double.infinity,
                                // it cover the 25% of total height
                                fit: BoxFit.fill,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      FadeAnimation(
                        1.5,
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Allocate & do Consultations\nAs You Want',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.035,
                                    color: kBackgroundColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Treat patients & serve the country',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kBackgroundColor.withOpacity(0.7),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      FadeAnimation(
                        1.6,
                        Container(
                          height: 45,
                          child: MaterialButton(
                            onPressed: () {
                              _register();
                              _register1();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ConsultantHomeScreen(''),
                                ),
                              );
                            },
                            color: Color(0xffFC9535),
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
