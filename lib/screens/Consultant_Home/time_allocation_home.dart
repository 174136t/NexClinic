import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/Consultant_Home/upload_time_slots.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeAllocationHome extends StatefulWidget {
  @override
  _TimeAllocationHomeState createState() => _TimeAllocationHomeState();
}

class _TimeAllocationHomeState extends State<TimeAllocationHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FadeAnimation(
        1.2,
        SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: size.height * 0.1,
                  width: size.width,
                  decoration: BoxDecoration(
                    gradient: purpleGradient,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Allocate free time for consultations",
                      style: TextStyle(
                          fontSize: size.height * 0.025,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TimelineTile(
                  alignment: TimelineAlign.center,
                  rightChild: Container(
                    child: Image.asset(
                      "assets/images/u4.png",
                      filterQuality: FilterQuality.high,
                      width: size.width * 0.3,
                      height: size.height*0.18,
                    ),
                  ),
                  isFirst: true,
                  indicatorStyle: IndicatorStyle(
                    width: 20,
                    color: Colors.blue[800],
                    indicatorY: 0.2,
                    padding: EdgeInsets.all(8),
                  ),
                  leftChild: Container(
                    child: Column(
                      children: [
                        // SvgPicture.asset(order_processed, height: 50, width: 50,),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UploadTimeSlots(
                                  day: "Monday",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.blue[800],
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.amber,width: 1.5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "Monday",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.height * 0.018,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Text(
                        //   "we are preparing your order",
                        //   style: TextStyle(fontSize: 12, color: Colors.black),
                        // )
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.center,
                  indicatorStyle: IndicatorStyle(
                    width: 20,
                    color: Colors.deepPurple[800],
                    padding: EdgeInsets.all(8),
                    indicatorY: 0.3,
                  ),
                  leftChild: Container(
                    child: Image.asset(
                      "assets/images/reshedule.png",
                      filterQuality: FilterQuality.high,
                      width: size.width * 0.3,
                    ),
                  ),
                  rightChild: Container(
                    child: Column(
                      children: [
                        // Image.asset("assets/images/corona.png",filterQuality: FilterQuality.high),
                        // SvgPicture.asset(order_confirmed, height: 50, width: 50,),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UploadTimeSlots(
                                  day: "Tuesday",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[800],
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.black,width: 1.5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "Tuesday",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.height * 0.018,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Text(
                        //   "order has been confirmed",
                        //   style: TextStyle(fontSize: 12, color: Colors.black),
                        // )
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.center,
                  indicatorStyle: IndicatorStyle(
                    width: 20,
                    color: Colors.deepPurple[700],
                    padding: EdgeInsets.all(8),
                    indicatorY: 0.3,
                  ),
                  rightChild: Container(
                    child: Image.asset(
                      "assets/images/patient.png",
                      filterQuality: FilterQuality.high,
                      width: size.width * 0.3,
                    ),
                  ),
                  leftChild: Container(
                    child: Column(
                      children: [
                        // Image.asset("assets/images/u1.png",filterQuality: FilterQuality.high,),
                        // SvgPicture.asset(order_shipped, height: 50, width: 50,),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UploadTimeSlots(
                                  day: "Wednesday",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[700],
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.black,width: 1.5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "Wednesday",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.height * 0.018,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Text(
                        //   "order has been shipped",
                        //   style: TextStyle(fontSize: 12, color: Colors.black),
                        // )
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.center,
                  indicatorStyle: IndicatorStyle(
                    width: 20,
                    color: Colors.blue[700],
                    padding: EdgeInsets.all(8),
                    indicatorY: 0.3,
                  ),
                  leftChild: Container(
                    child: Image.asset(
                      "assets/images/pendingDoc.png",
                      filterQuality: FilterQuality.high,
                      width: size.width * 0.3,
                    ),
                  ),
                  rightChild: Container(
                    child: Column(
                      children: [
                        // SvgPicture.asset(order_onTheWay, height: 50, width: 50,color: Colors.black,),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UploadTimeSlots(
                                  day: "Thursday",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                                // border: Border.all(color: Colors.black,width: 1.5),
                                color: Colors.blue[700],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "Thursday",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.height * 0.018,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Text(
                        //   "order in the way",
                        //   style: TextStyle(fontSize: 12, color: Colors.black),
                        // )
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.center,
                  indicatorStyle: IndicatorStyle(
                    width: 20,
                    color: Colors.blue[600],
                    padding: EdgeInsets.all(8),
                    indicatorY: 0.3,
                  ),
                  rightChild: Container(
                    child: Image.asset(
                      "assets/images/u2.png",
                      filterQuality: FilterQuality.high,
                      width: size.width * 0.3,
                    ),
                  ),
                  leftChild: Container(
                    child: Column(
                      children: [
                        // SvgPicture.asset(order_shipped, height: 50, width: 50,),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UploadTimeSlots(
                                  day: "Friday",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.blue[600],
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.black,width: 1.5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "Friday",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.height * 0.018,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Text(
                        //   "order has been shipped",
                        //   style: TextStyle(fontSize: 12, color: Colors.black),
                        // )
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.center,
                  indicatorStyle: IndicatorStyle(
                    width: 20,
                    color: Colors.deepPurple[600],
                    padding: EdgeInsets.all(8),
                    indicatorY: 0.3,
                  ),
                  leftChild: Container(
                    child: Image.asset(
                      "assets/images/u3.png",
                      filterQuality: FilterQuality.high,
                      width: size.width * 0.3,
                    ),
                  ),
                  rightChild: Container(
                    child: Column(
                      children: [
                        // SvgPicture.asset(order_onTheWay, height: 50, width: 50,color: Colors.black,),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UploadTimeSlots(
                                  day: "Saturday",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                                // border: Border.all(color: Colors.black,width: 1.5),
                                color: Colors.deepPurple[600],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "Saturday",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.height * 0.018,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Text(
                        //   "order in the way",
                        //   style: TextStyle(fontSize: 12, color: Colors.black),
                        // )
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.center,
                  indicatorStyle: IndicatorStyle(
                    width: 20,
                    color: Colors.deepPurple[500],
                    padding: EdgeInsets.all(8),
                    indicatorY: 0.3,
                  ),
                  rightChild: Container(
                    child: Image.asset(
                      "assets/images/corona.png",
                      filterQuality: FilterQuality.high,
                      width: size.width * 0.3,
                    ),
                  ),
                  leftChild: Container(
                    child: Column(
                      children: [
                        // SvgPicture.asset(order_shipped, height: 50, width: 50,),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UploadTimeSlots(
                                  day: "Sunday",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[500],
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.black,width: 1.5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "Sunday",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.height * 0.018,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Text(
                        //   "order has been shipped",
                        //   style: TextStyle(fontSize: 12, color: Colors.black),
                        // )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
