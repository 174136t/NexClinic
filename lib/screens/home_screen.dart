import 'dart:io';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/components/category_card.dart';
import 'package:doctor_consultation_app/components/doctor_card.dart';
import 'package:doctor_consultation_app/components/search_bar.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/Doctors/doctor_main_screen.dart';
import 'package:doctor_consultation_app/screens/Patient_Agora/index.dart';
import 'package:doctor_consultation_app/screens/login_screen.dart';
import 'package:doctor_consultation_app/screens/onboarding_screen.dart';
import 'package:doctor_consultation_app/screens/patient_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int currentIndex;
  FirebaseUser user;
  String uid;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    currentIndex = 0;

    getCurrentUser();
    print('aaaaaaaaaa');
    print(uid);
    print('aaaaaaaaaa');
  }

  void getCurrentUser() async {
    FirebaseUser _user = await _auth.currentUser();
    setState(() {
      user = _user;
      uid = _user.uid;
    });
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
      print(currentIndex);
    });
  }

  Future<bool> _onWillPop() {
    // DateTime now = DateTime.now();

    return showDialog(
      context: context,
      builder: (context) => new Theme(
        data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.grey[100],
            backgroundColor: Colors.white),
        child: AlertDialog(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35))),
          title: new Text('Are you sure?'),
          content: new Text('Do you want to exit from this App?'),
          actions: <Widget>[
            new FlatButton(
              color: Colors.red[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                // side: BorderSide(color: Colors.indigo)
              ),
              onPressed: () => exit(0),
              child: new Text('Yes'),
            ),
            new FlatButton(
              color: Colors.red[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.indigo)
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('No'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signOut() async {
    await _auth.signOut();
  }

  _showWarningDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => new Theme(
        data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.grey[100],
            backgroundColor: Colors.white),
        child: AlertDialog(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35))),
          title: new Text(
            'Are you sure?',
            // style: TextStyle(color: Colors.white),
          ),
          content: new Text(
            'Do you want to log out from this App?',
            // style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            new FlatButton(
              color: Colors.red[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                // side: BorderSide(color: Colors.indigo)
              ),
              onPressed: () {
                _signOut().whenComplete(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                });
              },
              child: new Text('Yes'),
            ),
            new FlatButton(
              color: Colors.red[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.indigo)
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('No'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          key: _drawerKey,
          backgroundColor: kBackgroundColor,
          drawer: Drawer(
              child: Container(
            decoration: BoxDecoration(
              gradient: purpleGradient2,
            ),
            child: ListView(
              children: <Widget>[
                /* AppBar(
                automaticallyImplyLeading: false,
                title: Text('Choose'),
              ),*/
                FadeAnimation(
                  1.2,
                  new UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.transparent),
                    accountName: new Text('Lahiru Neranjan'),
                    accountEmail: new Text('lahiruneranjan123@gmail.com'),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          new ExactAssetImage("assets/images/dooct.png"),
                      minRadius: 30,
                      maxRadius: 60,
                    ),
                  ),
                ),
                FadeAnimation(
                  1.3,
                  Divider(
                    color: Colors.white,
                  ),
                ),
                FadeAnimation(
                  1.4,
                  ListTile(
                    leading: Icon(Icons.video_call, color: Colors.white),
                    title: Text(
                      'Video Consultation',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => IndexPage()));
                    },
                  ),
                ),
                // ListTile(
                //   leading: Icon(Icons.history, color: Colors.indigo[400]),
                //   title: Text('Trip History'),
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => TripHistory(uid: uid)));
                //   },
                // ),
                // ListTile(
                //   leading: Icon(Icons.notifications, color: Colors.indigo[400]),
                //   title: Text('Notifications'),
                //   onTap: () {},
                // ),
                // ListTile(
                //   leading: Icon(Icons.help, color: Colors.indigo[400]),
                //   title: Text('Help'),
                //   onTap: () {
                //     print(widget.user.phoneNumber);
                //   },
                // ),
                // ListTile(
                //   leading: Icon(Icons.info, color: Colors.indigo[400]),
                //   title: Text('About us'),
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) => AboutUsScreen()));
                //   },
                // ),
                FadeAnimation(
                  1.4,
                  ListTile(
                      leading: Icon(Icons.exit_to_app, color: Colors.white),
                      title: Text(
                        'Log out',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        _showWarningDialog(context);
                      }),
                ),
              ],
            ),
          )),
          body: <Widget>[
            SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                      1.1,
                      Container(
                        decoration: BoxDecoration(
                          gradient: purpleGradient,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      _drawerKey.currentState.openDrawer();
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/menu.svg',
                                      color: Colors.white,
                                    ),
                                  ),
                                  // SvgPicture.asset('assets/icons/profile.svg'),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                'Find Your Consultant\nDoctor',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: kBackgroundColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: SearchBar(),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                      1.3,
                      Container(
                        decoration: BoxDecoration(
                          gradient: greenGradient,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Categories',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kBackgroundColor,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    'See All',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: lightColor,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            buildCategoryList(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      1.5,
                      Container(
                        decoration: BoxDecoration(
                          gradient: redGradient,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  child: Text(
                                    'Top Doctors',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kBackgroundColor,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  child: Text(
                                    'See All',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            buildDoctorList(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DoctorMainScreen(),
            IndexPage()
          ][currentIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PatientProfile(),
          ),
        );
            },
            child: Icon(Icons.account_circle),
            backgroundColor: Colors.red,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: BubbleBottomBar(
            backgroundColor: Colors.blue[100],
            hasNotch: true,
            fabLocation: BubbleBottomBarFabLocation.end,
            opacity: 0.9,
            currentIndex: currentIndex,
            onTap: changePage,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                    16)), //border radius doesn't work when the notch is enabled.
            elevation: 5,
            items: <BubbleBottomBarItem>[
              BubbleBottomBarItem(
                  backgroundColor: kCategoryTextColor,
                  icon: Icon(
                    CupertinoIcons.home,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    CupertinoIcons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  )),
              BubbleBottomBarItem(
                  backgroundColor: Colors.deepPurple,
                  icon: Icon(
                    Icons.person_pin,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    Icons.person_pin,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Doctors",
                    style: TextStyle(color: Colors.white),
                  )),
              BubbleBottomBarItem(
                  backgroundColor: Colors.indigo,
                  icon: Icon(
                    Icons.video_call,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    Icons.video_call,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Video ",
                    style: TextStyle(color: Colors.white),
                  )),
              // BubbleBottomBarItem(
              //     backgroundColor: Colors.green,
              //     icon: Icon(
              //       Icons.menu,
              //       color: Colors.black,
              //     ),
              //     activeIcon: Icon(
              //       Icons.menu,
              //       color: Colors.green,
              //     ),
              //     title: Text("Menu"))
            ],
          ),
        ),
      ),
    );
  }

  buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          CategoryCard(
            'Heart\nSurgeon',
            'assets/icons/heart.png',
            Colors.red[100],
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Dental\nSurgeon',
            'assets/icons/dental_surgeon.png',
            Colors.blue[100],
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Brain\nSpecialist',
            'assets/icons/brain_specialist.png',
            Colors.red[100],
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Eye\nSpecialist',
            'assets/icons/eye.png',
            Colors.green[100],
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }

  buildDoctorList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          DoctorCard(
            'Dr. Manoj Randeniya',
            'Heart Surgeon - Flower Hospitals',
            'assets/images/doctor1.png',
            kBackgroundColor,
          ),
          SizedBox(
            height: 20,
          ),
          DoctorCard(
            'Dr. Hasitha Dannagoda',
            'Dental Surgeon - Flower Hospitals',
            'assets/images/doctor2.png',
            kBackgroundColor,
          ),
          SizedBox(
            height: 20,
          ),
          DoctorCard(
            'Dr. Dhanuka Perera',
            'Eye Specialist - Flower Hospitals',
            'assets/images/doctor3.png',
            kBackgroundColor,
          ),
          SizedBox(
            height: 20,
          ),
          DoctorCard(
            'Dr. Tharindu Leonard',
            'Heart Surgeon - Flower Hospitals',
            'assets/images/doctor1.png',
            kBackgroundColor,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
