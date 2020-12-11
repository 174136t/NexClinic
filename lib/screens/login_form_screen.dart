import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/Widgets/curved_widget.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/Consultant_Home/consultant_home_screen.dart';
import 'package:doctor_consultation_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController phoneController = TextEditingController();
  String phoneNo;
  String hintText = "+94 712345678";
  FocusNode focusNode = FocusNode();

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

  Widget phoneNoField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mobile number',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
              decoration: BoxDecoration(
                  // color: Colors.teal[800],
                  // borderRadius: BorderRadius.circular(15)
                  ),
              child: TextFormField(
                cursorColor: Colors.black,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
                controller: phoneController,
                autofocus: false,
                focusNode: focusNode,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    prefixText: '+94 ',
                    prefixStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 18),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: Colors.black,
                    ),
                    errorStyle: TextStyle(color: Colors.red),
                    filled: true,
                    hintText: hintText),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty || phoneController.text.length != 9) {
                    return 'Please enter a valid phone number';
                  }
                },
                onSaved: (String value) {
                  this.phoneNo = value;
                },
              )),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hintText = '';
      } else {
        hintText = '+94 715676899';
      }
      setState(() {});
    });
  }

  Future<bool> doesNameAlreadyExist(String name) async {
    final QuerySnapshot result = await Firestore.instance
        .collection('users')
        .where('phone', isEqualTo: name)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    print('s');
    print(documents);
    print('s');
    if (documents.toString() == "[]") {
      showWarningDialog(context);
    } else if (documents.first.data['usertype'] == "patient") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else if (documents.first.data['usertype'] == "doctor") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConsultantHomeScreen(),
        ),
      );
    }
    print(result.documents.last.data);
    return documents.length == 1;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CurvedWidget(
                child: Container(
                  padding: const EdgeInsets.only(top: 70, left: 50),
                  width: double.infinity,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(gradient: purpleGradient),
                  child: Column(
                    children: [
                      FadeAnimation(
                        1.4,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Enter your mobile number',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Please enter the number that you enter when registering",
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
            SizedBox(height: size.height * 0.1),
            FadeAnimation(1.5, phoneNoField()),
            SizedBox(height: size.height * 0.1),
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => UserTypeScreen(),
                    //   ),
                    // );
                    // doesNameAlreadyExist(phoneNo);
                    print(phoneController.text);
                    FutureBuilder(
                      future: doesNameAlreadyExist(phoneController.text),
                      builder: (context, AsyncSnapshot<bool> result) {
                        if (!result.hasData) print('sssssss');
                        // return Container();
                        // future still needs to be finished (loading)
                        if (result
                            .data) // result.data is the returned bool from doesNameAlreadyExists
                          print('A company called "Nova" already exists.');
                        else
                          print('No company called "Nova" exists yet.');
                      },
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
                    'Submit',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: size.height * 0.025,
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
