import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/Doctor_Booking/booking_screen.dart';
import 'package:doctor_consultation_app/screens/My_appointments/past_screen.dart';
import 'package:doctor_consultation_app/screens/My_appointments/upcoming_screen.dart';
import 'package:flutter/material.dart';

class MyAppointmentsHomeScreen extends StatefulWidget {
  // var uid;
  // var name;
  // MyAppointmentsHomeScreen(this.uid,this.name);
  @override
  _MyAppointmentsHomeScreenState createState() =>
      _MyAppointmentsHomeScreenState();
}

class _MyAppointmentsHomeScreenState extends State<MyAppointmentsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child:  Scaffold(
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
                  text: 'Upcoming',
                ),
                Tab(
                  // icon: Icon(Icons.add_shopping_cart),
                  text: 'Past',
                ),
              ],
            ),
            title: Text(
              'My Appointments',
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
            children: [UpcomingScreen(), PastScreen()],
          
        ),
      ),
    );
  }
}
