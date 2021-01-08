import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/Widgets/curved_widget.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/OTP_Auth/phone_auth.dart';
import 'package:doctor_consultation_app/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:gender_selection/gender_selection.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email;
  String firstName;
  String lastName;
  String password;
  String phone;
  String address;
  String sex;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Widget firstNameField() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          controller: firstnameController,
          autofocus: false,
          decoration: InputDecoration(
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              prefixIcon: Padding(
                padding: EdgeInsets.all(0.0),
                child: Icon(
                  Icons.person_pin,
                  color: Colors.black,
                ), // icon is 48px widget.
              ),
              hintText: 'First name',
              hintStyle: TextStyle(color: Colors.black),
              errorStyle: TextStyle(color: Colors.red),
              filled: true,
              fillColor: Colors.white70
              //border: OutlineInputBorder(
              //   borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              ),
          validator: (value) {
            if (value.isEmpty) {
              return 'First name can\'t be empty';
            }
          },
          onSaved: (String value) {
            this.firstName = value;
          },
        ));
  }

  Widget lastNameField() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          controller: lastnameController,
          autofocus: false,
          decoration: InputDecoration(
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              prefixIcon: Padding(
                padding: EdgeInsets.all(0.0),
                child: Icon(
                  Icons.person_pin,
                  color: Colors.black,
                ), // icon is 48px widget.
              ),
              hintText: 'Last name',
              hintStyle: TextStyle(color: Colors.black),
              errorStyle: TextStyle(color: Colors.red),
              filled: true,
              fillColor: Colors.white70
              //border: OutlineInputBorder(
              //   borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Last name can\'t be empty';
            }
          },
          onSaved: (String value) {
            this.lastName = value;
          },
        ));
  }

  Widget emailField() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          controller: emailController,
          autofocus: false,
          decoration: InputDecoration(
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              prefixIcon: Padding(
                padding: EdgeInsets.all(0.0),
                child: Icon(
                  Icons.email,
                  color: Colors.black,
                ), // icon is 48px widget.
              ),
              hintText: 'E-Mail',
              hintStyle: TextStyle(color: Colors.black),
              errorStyle: TextStyle(color: Colors.red),
              filled: true,
              fillColor: Colors.white70),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value.isEmpty ||
                !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                    .hasMatch(value)) {
              return 'Please enter a valid email';
            }
          },
          onSaved: (String value) {
            this.email = value;
          },
        ));
  }

  Widget addressField() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          controller: addressController,
          autofocus: false,
          decoration: InputDecoration(
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              prefixIcon: Padding(
                padding: EdgeInsets.all(0.0),
                child: Icon(
                  Icons.home,
                  color: Colors.black,
                ), // icon is 48px widget.
              ),
              hintText: 'Address',
              hintStyle: TextStyle(color: Colors.black),
              errorStyle: TextStyle(color: Colors.red),
              filled: true,
              fillColor: Colors.white70
              //border: OutlineInputBorder(
              //   borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Address can\'t be empty';
            }
          },
          onSaved: (String value) {
            this.address = value;
          },
        ));
  }

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget passwordField() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          cursorColor: Colors.black,
          // style: TextStyle(
          //     color: Colors.black, fontWeight: FontWeight.w800, fontSize: 18),
          controller: passwordController,
          autofocus: false,
          obscureText: _obscureText,
          decoration: InputDecoration(
            // focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.black, ),
            //   borderRadius: BorderRadius.circular(15.0),
            // ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            // enabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.black, ),
            //   borderRadius: BorderRadius.circular(15.0),
            // ),
            prefixIcon: Icon(
              Icons.vpn_key,
              color: Colors.black,
            ),
            suffixIcon: GestureDetector(
              onTap: _toggle,
              child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: _obscureText == true
                      ? Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.visibility,
                          color: Colors.black,
                        )),
            ),
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.black),
            errorStyle: TextStyle(color: Colors.red),
            filled: true,
            fillColor: Colors.white70,
          ),
          validator: (value) {
            if (value.isEmpty || value.length < 6) {
              return 'Minimum password length is 6';
            }
          },
          onSaved: (String value) {
            this.password = value;
          },
        ));
  }

  void _showSnackBar() {
    final snackBar = SnackBar(
      content: Text('Please select your gender!'),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.blueGrey,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  child: CurvedWidget(
                    child: Container(
                      padding: const EdgeInsets.only(top: 50, left: 20),
                      width: double.infinity,
                      height: size.height * 0.3,
                      decoration: BoxDecoration(gradient: purpleGradient),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeAnimation(
                            1.4,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.height * 0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Fill these data correctly to begin",
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
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.25),
                  child: FadeAnimation(
                    1.6,
                    Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            firstNameField(),
                            SizedBox(
                              height: 5,
                            ),
                            lastNameField(),
                            SizedBox(
                              height: 5,
                            ),
                            emailField(),
                            SizedBox(
                              height: 5,
                            ),
                            passwordField(),
                            SizedBox(
                              height: 5,
                            ),
                            addressField(),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Select your Gender',
                              style: TextStyle(fontSize: 18),
                            ),
                            GenderSelection(
                              maleText: "Male",
                              femaleText: "Female",
                              linearGradient: pinkRedGradient,
                              selectedGenderIconBackgroundColor: Colors.indigo,
                              checkIconAlignment: Alignment.centerRight,
                              selectedGenderCheckIcon: null,
                              onChanged: (Gender gender) {
                                print(gender.index);
                                if (gender.index == 0) {
                                  this.sex = "Male";
                                } else {
                                  this.sex = "Female";
                                }

                                print('jbj  $sex');
                              },
                              equallyAligned: true,
                              animationDuration: Duration(milliseconds: 400),
                              isCircular: true,
                              isSelectedGenderIconCircular: true,
                              opacityOfGradient: 0.6,
                              padding: const EdgeInsets.all(3),
                              size: size.height * 0.12,
                            ),
                            SizedBox(
                              height: 30,
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
                                    print('sex$sex');
                                    if (_formKey.currentState.validate() &&
                                        sex != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PhoneLogin(
                                            firstname: firstnameController.text,
                                            lastname: lastnameController.text,
                                            email: emailController.text,
                                            address: addressController.text,
                                            password: passwordController.text,
                                            sex: sex,
                                          ),
                                        ),
                                      );
                                    } else if (_formKey.currentState
                                            .validate() &&
                                        sex == null) {
                                      _showSnackBar();
                                    }
                                  },
                                  // color: Color(0xffFC9535),
                                  // padding: EdgeInsets.symmetric(
                                  //   horizontal: 30,
                                  // ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: size.height * 0.025,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 22,
            // ),

            SizedBox(
              height: 15,
            ),
            FadeAnimation(
              1.8,
              Align(
                alignment: Alignment.bottomCenter,
                child: Text("NexClinic V.1.0"),
              ),
            ),

            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
