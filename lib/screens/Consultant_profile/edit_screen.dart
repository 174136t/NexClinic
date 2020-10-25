import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/Widgets/curved_widget.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String email;
  String firstName;
  String lastName;
  String password;
  String phone;
  String address;
  String sex;
  String nic;
  String _selectedSpeciality;
  List<String> _specialities = [
    'Paediatrician',
    'Dermaotoologist',
    'Physician',
    'Psychiatrist'
  ]; // Option 2

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nicController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController specialityController = TextEditingController();

  Widget firstNameField() {
    return Container(
        width: 300,
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
        width: 300,
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
        width: 300,
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
        width: 300,
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

  Widget nicField() {
    return Container(
        width: 300,
        child: TextFormField(
          controller: nicController,
          autofocus: false,
          decoration: InputDecoration(
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              prefixIcon: Padding(
                padding: EdgeInsets.all(0.0),
                child: Icon(
                  Icons.perm_identity,
                  color: Colors.black,
                ), // icon is 48px widget.
              ),
              hintText: 'NIC No',
              hintStyle: TextStyle(color: Colors.black),
              errorStyle: TextStyle(color: Colors.red),
              filled: true,
              fillColor: Colors.white70
              //border: OutlineInputBorder(
              //   borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              ),
          validator: (value) {
            if (value.isEmpty || value.length != 10) {
              return 'Please enter a valid NIC';
            }
          },
          onSaved: (String value) {
            this.nic = value;
          },
        ));
  }

  Widget specialityField() {
    return Container(
        width: 300,
        child: TextFormField(
          controller: specialityController,
          autofocus: false,
          decoration: InputDecoration(
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              prefixIcon: Padding(
                padding: EdgeInsets.all(0.0),
                child: Icon(
                  Icons.merge_type,
                  color: Colors.black,
                ), // icon is 48px widget.
              ),
              hintText: 'Speciality',
              hintStyle: TextStyle(color: Colors.black),
              errorStyle: TextStyle(color: Colors.red),
              filled: true,
              fillColor: Colors.white70
              //border: OutlineInputBorder(
              //   borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              ),
          validator: (value) {
            if (value.isEmpty || value.length < 3) {
              return 'Please enter a valid speciality';
            }
          },
          onSaved: (String value) {
            this.nic = value;
          },
        ));
  }

  void _showSnackBar() {
    final snackBar = SnackBar(
      content: Text('Please select your Spoeciality!'),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.blueGrey,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
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
                  padding: const EdgeInsets.only(top: 16, left: 16),
                  width: double.infinity,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(gradient: purpleGradient),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 0, top: 16),
                            width: size.width * 0.10,
                            height: size.width * 0.10,
                            decoration: BoxDecoration(
                                // color: Colors.white,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey,
                                //     offset: Offset(0.0, 1.0), //(x,y)
                                //     blurRadius: 6.0,
                                //   ),
                                // ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                      ),
                      FadeAnimation(
                        1.4,
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'Update Profile',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: Text(
                                    "You can update your profile at anytime\n(Make sure your data is correct)",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
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
                    addressField(),
                    SizedBox(
                      height: 5,
                    ),
                    nicField(),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(color: Colors.grey[600])),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: DropdownButton(
                            //   icon: Icon(Icons.folder_special),
                            isDense: true,
                            isExpanded: true,
                            hint: Text(
                              'Please choose your Speciality',
                              style: TextStyle(color: Colors.black),
                            ), // Not necessary for Option 1
                            value: _selectedSpeciality,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedSpeciality = newValue;
                              });
                              print(_selectedSpeciality);
                            },
                            items: _specialities.map((location) {
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 45,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                        // gradient: redGradient,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey,
                        //     offset: Offset(0.0, 5.0), //(x,y)
                        //     blurRadius: 6.0,
                        //   ),
                        // ],
                        gradient: new LinearGradient(
                            colors: [
                              const Color(0xFF3366FF),
                              Colors.deepPurple,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: MaterialButton(
                        // color: Colors.blue[800],
                        onPressed: () {
                          print('sex$sex');
                          if (_formKey.currentState.validate() &&
                              _selectedSpeciality != null) {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => PhoneLogin(),
                            //   ),
                            // );
                          }
                        },
                        // color: Color(0xffFC9535),
                        // padding: EdgeInsets.symmetric(
                        //   horizontal: 30,
                        // ),
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(20),
                        // ),
                        child: Text(
                          'Update',
                          style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
