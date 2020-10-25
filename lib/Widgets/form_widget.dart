import 'package:flutter/material.dart';

  String email;
  String firstName;
  String password;
  String phone;


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

Widget firstNameField() {
    return Container(
        width: 300,
        child: TextFormField(
          controller: nameController,
          autofocus: false,
          decoration: InputDecoration(
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              prefixIcon: Padding(
                padding: EdgeInsets.all(0.0),
                child: Icon(
                  Icons.person_outline,
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
              return 'Username can\'t be empty';
            }
          },
          onSaved: (String value) {
            firstName = value;
          },
        ));
  }
