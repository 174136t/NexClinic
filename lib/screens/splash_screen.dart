import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation_app/screens/Consultant_Home/consultant_home_screen.dart';
import 'package:doctor_consultation_app/screens/home_screen.dart';
import 'package:doctor_consultation_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

Widget logo() {
  return Center(
    //child: CircleAvatar(
    child: Image(image: AssetImage('assets/ab.png')),
    //     maxRadius: 60.0,
    //     minRadius: 20.0,
    //     backgroundColor: Colors.transparent,
    //  // ),
  );
}

Widget text() {
  return Center(
      child: RichText(
          text: TextSpan(
              text: 'n',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
        TextSpan(
            text: 'E',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18)),
        TextSpan(
            text: 'X',
            style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        TextSpan(
            text: 'E',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18)),
        TextSpan(
            text: 'Y',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        TextSpan(
            text: 'O',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18)),
        TextSpan(
            text: '\u2122 ',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18)),
        TextSpan(
            text: ' Solutions',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18))
      ]))
      // Text(
      //   "Nexeyo Solutions\u2122 2020",
      //   style: TextStyle(
      //       fontSize: 20, color: Colors.black, fontStyle: FontStyle.normal),
      // ),
      );
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseUser user;
  String uid;
  String type;
  @override
  void initState() {
    super.initState();
    // getCurrentUser();
    // _getUserName();

    /// Initialize data, then navigator to Home screen.
    initData().then((value) {
      // print('val' + value.toString());
      print("un");
      _getUserName();
      print('nh');
    });
  }

  // void getCurrentUser() async {
  //   FirebaseUser _user = await _firebaseAuth.currentUser();
  //   setState(() {
  //     user = _user;
  //     uid = _user.uid;
  //   });
  // }

  Future<void> _getUserName() async {
    try {
      Firestore.instance
          .collection('users')
          .document((await FirebaseAuth.instance.currentUser()).uid)
          .get()
          .then((value) async {
        // setState(() {
        print('ane');
        // print(value.data['usertype']);
        uid = (await FirebaseAuth.instance.currentUser()).uid;
        print('ane');
        if (value.data != null) {
          type = value.data['usertype'];
        }
        navigateToHomeScreen();
        // _userName = value.data['UserName'].toString();
        // });
      });
    } catch (e) {
      print('ammo$e');
      navigateToHomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Material(
        child: Container(
      //  decoration: BoxDecoration(
      //         gradient: purpleGradient,

      //       ),
      child: Column(
        // child: FlutterLogo(size: 200),
        children: <Widget>[
          SizedBox(
            height: size.height * 0.7,
          ),
          // logo(),
          // SizedBox(
          //   height: 200,
          // ),
          text(),
        ],
      ),
    ));
  }

  /// NEW CODE.
  /// We can do long run task here.
  /// In this example, we just simply delay 3 seconds, nothing complicated.
  Future<bool> initData() async {
    bool done;
    await Future.delayed(Duration(seconds: 3));

    done = true;
    return done;
  }

  /// NEW CODE.
  /// Navigate to Home screen.
  void navigateToHomeScreen() {
    /// Push home screen and replace (close/exit) splash screen.
    // _read();
    print('in nav');
    print(type);
    // print(token);
    // if (token != null && userType == "Developer") {
    user == null && type == null
        ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen(type, uid)
                // ConsultantHomeScreen(uid)
                ))
        : (type == 'patient')
            ? Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()))
            : (type == 'doctor')
                ? Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConsultantHomeScreen(uid)))
                : Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen(type, uid)));
  }
}
