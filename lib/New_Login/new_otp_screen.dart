import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation_app/New_Login/new_otp_auth.dart';
import 'package:doctor_consultation_app/screens/Consultant_Home/consultant_home_screen.dart';
import 'package:doctor_consultation_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OTPScreen extends StatefulWidget {
  final String mobileNumber;
  final String type;
  OTPScreen({
    Key key,
    @required this.mobileNumber,
    this.type,
  })  : assert(mobileNumber != null),
        super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //final dbRef = FirebaseDatabase.instance.reference().child("Passengers");
  // static FirebaseDatabase database = new FirebaseDatabase();
  // DatabaseReference dbRe = database.reference().child("Passengers");
  // String uid;

  /// Control the input text field.
  TextEditingController _pinEditingController = TextEditingController();

  /// Decorate the outside of the Pin.
  PinDecoration _pinDecoration =
      UnderlineDecoration(enteredColor: Colors.black, hintText: '******');

  bool isCodeSent = false;
  String _verificationId;

  @override
  void initState() {
    super.initState();
    _onVerifyCode();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _register() async {
    try {
      final FirebaseUser user = (await _auth.currentUser(
          // email: widget.email,
          // password: '',
          ));
      // .user;
      if (user != null) {
        print('doctor updating!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        await Firestore.instance
            .collection('doctors')
            .document(user.uid)
            .updateData({
          'uid': user.uid,
        });

        print('doctor updated!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
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
        print('user updating!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        await Firestore.instance
            .collection('users')
            .document(user.uid)
            .updateData({
          'uid': user.uid,
        });

        print('user updated!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
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

  @override
  Widget build(BuildContext context) {
    print("isValid - $isCodeSent");
    print("mobile ${widget.mobileNumber}");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          child: Container(
            padding: EdgeInsets.only(left: 16.0, bottom: 16, top: 4),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Verify Details",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "OTP sent to ${widget.mobileNumber}",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(100),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PinInputTextField(
                pinLength: 6,
                decoration: _pinDecoration,
                controller: _pinEditingController,
                autoFocus: true,
                textInputAction: TextInputAction.done,
                onSubmit: (pin) {
                  if (pin.length == 6) {
                    _onFormSubmitted();
                  } else {
                    showToast("Invalid OTP", Colors.red);
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0)),
                    child: Text(
                      "ENTER OTP",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (_pinEditingController.text.length == 6) {
                        _onFormSubmitted();
                      } else {
                        showToast("Invalid OTP", Colors.red);
                      }
                    },
                    padding: EdgeInsets.all(16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showToast(message, Color color) {
    print(message);
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _onVerifyCode() async {
    // final FirebaseUser users = await _firebaseAuth.currentUser();
    // uid = users.uid;
    // DataSnapshot d = await dbRe.child(uid).once();

    setState(() {
      isCodeSent = true;
    });
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _firebaseAuth
          .signInWithCredential(phoneAuthCredential)
          .then((AuthResult value) {
        if (value.user != null) {
          // Handle logged in state
          print(value.user.phoneNumber);

          print("gggggggggggggggggggggggggggggggg ");
          if (widget.type == "patient") {
            _register1();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
                (Route<dynamic> route) => false);
          } else if (widget.type == "doctor") {
            _register1();
            _register();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => ConsultantHomeScreen(''),
                ),
                (Route<dynamic> route) => false);
          }
        } else {
          print("bbbb");
          showToast("Error validating OTP, try again", Colors.red);
        }
      }).catchError((error) {
        print("ccccc");
        showToast("Try again in sometime:>$error", Colors.red);
      });
    };
    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      showToast(authException.message, Colors.red);
      print("aaa");
      setState(() {
        isCodeSent = false;
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+94${widget.mobileNumber}", //  +94
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  void _onFormSubmitted() async {
    AuthCredential _authCredential = PhoneAuthProvider.getCredential(
        verificationId: _verificationId, smsCode: _pinEditingController.text);

    _firebaseAuth
        .signInWithCredential(_authCredential)
        .then((AuthResult value) {
      if (value.user != null) {
        // Handle loogged in state
        print(value.user.phoneNumber);
        if (widget.type == "patient") {
            _register1();
           
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
              (Route<dynamic> route) => false);
        } else if (widget.type == "doctor") {
            _register1();
            _register();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => ConsultantHomeScreen(''),
              ),
              (Route<dynamic> route) => false);
        }
      } else {
        showToast("Error validating OTP, try again", Colors.red);
      }
    }).catchError((error) {
      showToast("Something went wrong", Colors.red);
    });
  }
}
