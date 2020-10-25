import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/Doctors/Categories/all_doc_screen.dart';
import 'package:doctor_consultation_app/screens/Doctors/Categories/dentist_screen.dart';
import 'package:doctor_consultation_app/screens/Doctors/Categories/oncologist_screen.dart';
import 'package:doctor_consultation_app/screens/Doctors/Categories/paedetrician_screen.dart';
import 'package:doctor_consultation_app/screens/Doctors/Categories/urologist_screen.dart';
import 'package:flutter/material.dart';

class DoctorMainScreen extends StatefulWidget {
  @override
  _DoctorMainScreenState createState() => _DoctorMainScreenState();
}

class _DoctorMainScreenState extends State<DoctorMainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: purpleGradient),
          ),
          title: Text(
            "Available Specialists",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.amber[800],
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.amber[800],
            labelStyle: TextStyle(fontSize: 20),
            unselectedLabelStyle: TextStyle(fontSize: 16),
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Paedetrician",
              ),
              Tab(
                text: "Oncologist",
              ),
              Tab(
                text: "Urologist",
              ),
              Tab(
                text: "Dentist",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllDocScreen(),
            PaedetricianScreen(),
            OncologistScreen(),
            UrologistScreen(),
            DentistScreen()
          ],
        ),
      ),
    );
  }
}
