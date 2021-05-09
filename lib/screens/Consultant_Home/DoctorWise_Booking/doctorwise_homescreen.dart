import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/Consultant_Home/DoctorWise_Booking/accepted_patient_list.dart';
import 'package:doctor_consultation_app/screens/Consultant_Home/DoctorWise_Booking/patient_list.dart';
import 'package:flutter/material.dart';

class DoctorWiseHomeScreen extends StatefulWidget {
  @override
  _DoctorWiseHomeScreenState createState() => _DoctorWiseHomeScreenState();
}

class _DoctorWiseHomeScreenState extends State<DoctorWiseHomeScreen> {
  @override
  Widget build(BuildContext context) {
   return DefaultTabController(
      length: 2,
      child: 
       
        Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(gradient: purpleGradient),
            ),
            backgroundColor: Colors.blue[100],
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              onTap: (index) {
                // Tab index when user select it, it start from zero
              },
              tabs: [
                Tab(
                  // icon: Icon(Icons.card_travel),
                  text: 'Pending',
                ),
                Tab(
                  // icon: Icon(Icons.add_shopping_cart),
                  text: 'Accepted',
                ),
              ],
            ),
            title: Text(
              'My Consultations',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) =>
                  //         BookingScreen(widget.uid, widget.name),
                  //   ),
                  // );
                }),
          ),
          body: TabBarView(
            children: [PatientList(), AcceptedPatientList()],
          ),
        ),
      
    );
  }
}
