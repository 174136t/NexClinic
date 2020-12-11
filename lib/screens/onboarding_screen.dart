import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../constant.dart';

class OnboardingScreen extends StatefulWidget {
  final FirebaseUser user;
  final String mobileNumber;
  final String firstname;
  final String lastname;
  final String email;
  final String address;
  final String password;
  final String sex;

  const OnboardingScreen(
      {Key key,
      this.user,
      this.mobileNumber,
      this.firstname,
      this.lastname,
      this.email,
      this.address,
      this.sex, this.password})
      : super(key: key);
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _register() async {
    try {
      final FirebaseUser user = (await _auth.currentUser(
          // email: widget.email,
          // password: '',
          ));
      // .user;
      if (user != null) {
        print('user adding!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        await Firestore.instance
            .collection('users')
            .document(user.uid)
            .setData({
          'firstname': widget.firstname,
          'lastname': widget.lastname,
          'email': widget.email,
          'address': widget.address,
          'gender': widget.sex,
          'phone': widget.mobileNumber,
          'password':widget.password,
          'usertype': "patient",
        });
        print("${widget.firstname}");
        print('user added!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
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
                                  'Choose The Consultation\nYou Want',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: kBackgroundColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Find out the best consultants,\nas your desire',
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
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
