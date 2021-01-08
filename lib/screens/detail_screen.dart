import 'package:doctor_consultation_app/Widgets/form_widget.dart';
import 'package:doctor_consultation_app/components/schedule_card.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/Doctor_Booking/booking_screen.dart';
import 'package:doctor_consultation_app/screens/Doctors/Categories/all_doc_screen.dart';
import 'package:doctor_consultation_app/screens/Doctors/doctor_main_screen.dart';
import 'package:doctor_consultation_app/screens/Patient_Agora/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailScreen extends StatelessWidget {
  var name;
  var description;
  var imageUrl;
  var uid;

  DetailScreen(this.name, this.description, this.imageUrl, this.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/detail_illustration.png'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DoctorMainScreen()),
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/icons/back.svg',
                        height: 18,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/3dots.svg',
                      height: 18,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            imageUrl,
                            height: 100,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kTitleTextColor,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                description,
                                style: TextStyle(
                                  color: kTitleTextColor.withOpacity(0.7),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: kBlueColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/phone.svg',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: kYellowColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/chat.svg',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => IndexPage()),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: kOrangeColor.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/icons/video.svg',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'About Doctor',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Dr. Stella is the top most heart surgeon in Flower\nHospital. She has done over 100 successful sugeries\nwithin past 3 years. She has achieved several\nawards for her wonderful contribution in her own\nfield. She’s available for private consultation for\ngiven schedules.',
                        style: TextStyle(
                          height: 1.6,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Upcoming Schedules',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ScheduleCard(
                        'Consultation',
                        'Sunday . 9am - 11am',
                        '12',
                        'Jan',
                        kBlueColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // ScheduleCard(
                      //   'Consultation',
                      //   'Sunday . 9am - 11am',
                      //   '13',
                      //   'Jan',
                      //   kYellowColor,
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // ScheduleCard(
                      //   'Consultation',
                      //   'Sunday . 9am - 11am',
                      //   '14',
                      //   'Jan',
                      //   kOrangeColor,
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: redGradient,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BookingScreen(uid, name),
                                  ),
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
                                'Book an Appointment',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
