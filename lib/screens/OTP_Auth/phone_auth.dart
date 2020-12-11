import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/Widgets/curved_widget.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/OTP_Auth/components/otp_screen.dart';
import 'package:flutter/material.dart';

class PhoneLogin extends StatefulWidget {
  final String firstname;
  final String lastname;
  final String email;
  final String address;
  final String sex;
  final String password;
  PhoneLogin(
      {Key key,
      this.firstname,
      this.lastname,
      this.email,
      this.address,
      this.sex, this.password})
      : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> with TickerProviderStateMixin {
  final TextEditingController _phoneNumberController = TextEditingController();

  bool isValid = false;

  Future<Null> validate(StateSetter updateState) async {
    print("in validate : ${_phoneNumberController.text.length}");
    if (_phoneNumberController.text.length == 9) {
      // 9 karanna
      updateState(() {
        isValid = true;
      });
    }
  }

  AnimationController controller;
  Animation<double> animation;

  // initState() {
  //   super.initState();
  //   controller = AnimationController(
  //       duration: const Duration(milliseconds: 3000), vsync: this);
  //   animation =
  //       CurvedAnimation(parent: controller, curve: Curves.easeInOutQuint);

  //   animation.addStatusListener((status) {
  //     if (status == AnimationStatus.completed) {
  //       controller.reverse();
  //     } else if (status == AnimationStatus.dismissed) {
  //       controller.forward();
  //     }
  //   });

  //   controller.forward();
  // }

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
                  height: size.height * 0.8,
                  decoration: BoxDecoration(gradient: purpleGradient),
                  //width: double.infinity,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeAnimation(
                            1.4,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'One more step',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Click the below button to \nverify your phone number",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          FadeAnimation(
                            1.5,
                            ClipRRect(
                              child: Image.asset(
                                "assets/images/down.png",
                                height: size.height * 0.3,
                                // width: double.infinity,
                                // it cover the 25% of total height
                                fit: BoxFit.fill,
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
            FadeAnimation(
              1.8,
              Container(
                //color: Colors.black,
                width: MediaQuery.of(context).size.width * 0.6,
                //padding: EdgeInsets.only(left: 8.0, top: 30),
                alignment: Alignment.center,
                child: ButtonTheme(
                  height: 5,
                  child: new RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Colors.blue[800],
                    onPressed: () => {},
                    child: new Container(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: new FlatButton(
                              onPressed: () {
                                print("pressed");
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext bc) {
                                      print("VALID CC: $isValid");

                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter state) {
                                        return Container(
                                          padding: EdgeInsets.all(16),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.7,
                                          child: new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'VERIFY',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.red),
                                              ),
                                              Text(
                                                'Verify & continue to choose your consultant',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 0),
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  controller:
                                                      _phoneNumberController,
                                                  autofocus: true,
                                                  onChanged: (text) {
                                                    validate(state);
                                                  },
                                                  decoration: InputDecoration(
                                                    hintText: '760123456',
                                                    labelText:
                                                        "9 digit mobile number",
                                                    labelStyle: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                    prefix: Container(
                                                      padding:
                                                          EdgeInsets.all(4.0),
                                                      child: Text(
                                                        "+94", // +94
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  autovalidate: true,
                                                  autocorrect: false,
                                                  maxLengthEnforced: true,
                                                  validator: (value) {
                                                    return !isValid
                                                        ? 'Please provide a valid 9 digit phone number'
                                                        : null;
                                                  },
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(16),
                                                child: Center(
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                    child: RaisedButton(
                                                      color: !isValid
                                                          ? Theme.of(context)
                                                              .primaryColor
                                                              .withOpacity(0.5)
                                                          : Theme.of(context)
                                                              .primaryColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0)),
                                                      child: Text(
                                                        !isValid
                                                            ? "ENTER PHONE NUMBER"
                                                            : "CONTINUE",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      onPressed: () {
                                                        if (isValid) {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        OTPScreen(
                                                                  mobileNumber:
                                                                      _phoneNumberController
                                                                          .text,
                                                                  email: widget
                                                                      .email,
                                                                  firstname: widget
                                                                      .firstname,
                                                                  lastname: widget
                                                                      .lastname,
                                                                  sex: widget
                                                                      .sex,
                                                                  address: widget
                                                                      .address,
                                                                      password: widget.password,
                                                                ),
                                                              ));
                                                        } else {
                                                          validate(state);
                                                        }
                                                      },
                                                      padding:
                                                          EdgeInsets.all(16.0),
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
                              padding: EdgeInsets.only(
                                top: 20.0,
                                bottom: 20.0,
                              ),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.phone_android,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Number Verification",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
