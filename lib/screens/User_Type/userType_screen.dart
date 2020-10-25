import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/Widgets/curved_widget.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/Consultant_Register/consultant_register_screen.dart';
import 'package:doctor_consultation_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:gender_selection/gender_selection.dart';

class UserTypeScreen extends StatefulWidget {
  @override
  _UserTypeScreenState createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  String sex;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: CurvedWidget(
                child: Container(
                  padding: const EdgeInsets.only(top: 70, left: 50),
                  width: double.infinity,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(gradient: purpleGradient),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height:size.height * 0.05 ,),
                      FadeAnimation(
                        1.2,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Choose your type',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Select who you are to proceed",
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
              height: 10,
            ),
            FadeAnimation(
              1.3,
              Center(
                child: Text(
                  'Select your type',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            FadeAnimation(
                1.4,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConsultantRegisterScreen(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                child: Image.asset(
                                  "assets/images/consultant.png",
                                  height: size.width * 0.3,
                                  width: size.width * 0.3,
                                  // width: double.infinity,
                                  // it cover the 25% of total height
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Text(
                            'I\'m a Consultant',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width * 0.1),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                child: Image.asset(
                                  "assets/images/patient.png",
                                  height: size.width * 0.3,
                                  width: size.width * 0.3,
                                  // width: double.infinity,
                                  // it cover the 25% of total height
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            
                            height: size.height * 0.05,
                          ),
                          Text(
                            'I need a Consultant',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
