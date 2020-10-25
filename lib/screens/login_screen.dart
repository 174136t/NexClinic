import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/Widgets/curved_widget.dart';
import 'package:doctor_consultation_app/screens/Consultant_Home/consultant_home_screen.dart';
import 'package:doctor_consultation_app/screens/User_Type/userType_screen.dart';
import 'package:doctor_consultation_app/screens/home_screen.dart';
import 'package:doctor_consultation_app/screens/onboarding_screen.dart';
import 'package:doctor_consultation_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                height: 45,
                child: OutlineButton(
                  borderSide: BorderSide(
                      color: Colors.blue[800],
                      style: BorderStyle.solid,
                      width: 3),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
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
                    'Sign In',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
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
                height: 45,
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
                      fontSize: 18,
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
