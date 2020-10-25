import 'package:doctor_consultation_app/screens/login_screen.dart';
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
    child: 
    RichText(text:TextSpan(
      text: 'n',
      style: TextStyle(color: Colors.blue,fontSize: 25,fontWeight: FontWeight.bold),
      children: <TextSpan>[
        TextSpan(
          text: 'E',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18)
        ),
        TextSpan(
          text: 'X',style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 18)
        ),TextSpan(
          text: 'E',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18)
        ),TextSpan(
          text: 'Y',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 18)
        ),TextSpan(
          text: 'O',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18)
        ),
        TextSpan(
          text: '\u2122 ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18)
        ),
        TextSpan(
          text: ' Solutions',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)
        )
      ]
    ))
    // Text(
    //   "Nexeyo Solutions\u2122 2020",
    //   style: TextStyle(
    //       fontSize: 20, color: Colors.black, fontStyle: FontStyle.normal),
    // ),
  );
}



class _SplashScreenState extends State<SplashScreen> {
  // String email;
  // String password;
  // String token;
  // int id;
  // String userType;

  /// NEW CODE.
  @override
  void initState() {
    super.initState();

    /// Initialize data, then navigator to Home screen.
    initData().then((value) {
      // print('val' + value.toString());
      // print(token);
      navigateToHomeScreen();
    });
  
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
            height: size.height*0.7,
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
    await Future.delayed(Duration(seconds: 2));
   
    done = true;
    return done;
  }

  /// NEW CODE.
  /// Navigate to Home screen.
  void navigateToHomeScreen() {
    /// Push home screen and replace (close/exit) splash screen.
    // _read();
    print('in nav');
    // print(token);
    // if (token != null && userType == "Developer") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
     
  }
}
