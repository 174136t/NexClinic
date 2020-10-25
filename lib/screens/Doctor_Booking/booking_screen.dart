import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/My_appointments/myAppintmentsHome_screen.dart';
import 'package:doctor_consultation_app/screens/detail_screen.dart';
import 'package:doctor_consultation_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingScreen extends StatefulWidget {
  // var _name;
  // var _description;
  // var _imageUrl;
  // var _bgColor;
  // BookingScreen(this._name, this._description, this._imageUrl, this._bgColor);
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  CalendarController _controller;
  Color color = Colors.white;
  int checkedIndex1 = -1;
  int checkedIndex2 = -1;
  int checkedIndex3 = -1;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => new Theme(
            data: Theme.of(context).copyWith(
                dialogBackgroundColor: Colors.white,
                backgroundColor: Colors.white),
            child: Container(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                title: FadeAnimation(
                  1.1,
                  Center(
                    child: Text(
                      'Your Appointment has been scheduled',
                      style: TextStyle(
                          color: Colors.blue[800], fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                content: FadeAnimation(
                  1.2,
                  Text(
                    'You will be notified with a notification whether the doctor approves it or not',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                actions: <Widget>[
                  Column(
                    children: [
                      FadeAnimation(
                        1.3,
                        ClipRRect(
                          child: Image.asset(
                            "assets/images/dooct.png",
                            height: MediaQuery.of(context).size.height * 0.35,
                            // width: double.infinity,
                            // it cover the 25% of total height
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      FadeAnimation(
                        1.4,
                        Container(
                          decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: [
                                    const Color(0xFF3366FF),
                                    Colors.deepPurple,
                                  ],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(1.0, 0.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                              borderRadius: BorderRadius.circular(5.0)),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              // side: BorderSide(color: Colors.indigo)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('View my appointments',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MyAppointmentsHomeScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      FadeAnimation(
                        1.4,
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.blue[800])),
                            child: Text('Back to home',
                                style: TextStyle(color: Colors.blue[800])),
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }

  Widget buildMorningCard(int index) {
    bool checked = index == checkedIndex1;

    return GestureDetector(
      onTap: () {
        if (checkedIndex1 == -1) {
          setState(() {
            checkedIndex1 = index;
          });
        } else if (checkedIndex1 == index) {
          setState(() {
            checkedIndex1 = -1;
          });
        } else {
          setState(() {
            checkedIndex1 = index;
          });
        }
      },
      child: Stack(
        children: <Widget>[
          Card(
            color: checked ? Colors.orange : Colors.white,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(12),
            // ),
            child: Container(
              child: Center(child: Text("$index")),
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Offstage(
              offstage: !checked,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.check,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAfternoonCard(int index) {
    bool checked = index == checkedIndex2;

    return GestureDetector(
      onTap: () {
        if (checkedIndex2 == -1) {
          setState(() {
            checkedIndex2 = index;
          });
        } else if (checkedIndex2 == index) {
          setState(() {
            checkedIndex2 = -1;
          });
        } else {
          setState(() {
            checkedIndex2 = index;
          });
        }
      },
      child: Stack(
        children: <Widget>[
          Card(
            color: checked ? Colors.orange : Colors.white,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(12),
            // ),
            child: Container(
              child: Center(child: Text("$index")),
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Offstage(
              offstage: !checked,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.check,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEveningCard(int index) {
    bool checked = index == checkedIndex3;

    return GestureDetector(
      onTap: () {
        if (checkedIndex3 == -1) {
          setState(() {
            checkedIndex3 = index;
          });
        } else if (checkedIndex3 == index) {
          setState(() {
            checkedIndex3 = -1;
          });
        } else {
          setState(() {
            checkedIndex3 = index;
          });
        }
      },
      child: Stack(
        children: <Widget>[
          Card(
            color: checked ? Colors.orange : Colors.white,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(12),
            // ),
            child: Container(
              child: Center(child: Text("$index")),
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Offstage(
              offstage: !checked,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.check,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: purpleGradient),
        ),
        title: Text(
          'Apppointment',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }),
      ),
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: TableCalendar(
                initialCalendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                    todayColor: Colors.blue,
                    selectedColor: Theme.of(context).primaryColor,
                    todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.white)),
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  formatButtonTextStyle: TextStyle(color: Colors.white),
                  formatButtonShowsNext: false,
                ),
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: (date, events) {
                  print(date.toUtc());
                },
                builders: CalendarBuilders(
                  selectedDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                  todayDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                calendarController: _controller,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Available Slots',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue[800]),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Morning Slots',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 6, //data.length,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio:
                                    MediaQuery.of(context).size.width /
                                        (MediaQuery.of(context).size.height *
                                            0.2 /
                                            1),
                                crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return buildMorningCard(index);
                        }),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Afternoon Slots',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 6, //data.length,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio:
                                    MediaQuery.of(context).size.width /
                                        (MediaQuery.of(context).size.height *
                                            0.2 /
                                            1),
                                crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return buildAfternoonCard(index);
                        }),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Evening Slots',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 6, //data.length,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio:
                                    MediaQuery.of(context).size.width /
                                        (MediaQuery.of(context).size.height *
                                            0.2 /
                                            1),
                                crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return buildEveningCard(index);
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blue[800],
          onPressed: () {
            showWarningDialog(context);
          },
          label: Text(
            "Confirm Appointment",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
