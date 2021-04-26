import 'dart:io';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_consultation_app/Aimation/Fade_animation.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/Consultant_Agora/index.dart';
import 'package:doctor_consultation_app/screens/Consultant_Home/DoctorWise_Booking/doctorwise_homescreen.dart';
import 'package:doctor_consultation_app/screens/Consultant_Home/time_allocation_home.dart';
import 'package:doctor_consultation_app/screens/Consultant_profile/edit_screen.dart';
import 'package:doctor_consultation_app/screens/Consultant_profile/proofile_update_screen.dart';
import 'package:doctor_consultation_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spring/spring.dart';

class ConsultantHomeScreen extends StatefulWidget {
  final String uid;
  ConsultantHomeScreen(this.uid);
  @override
  _ConsultantHomeScreenState createState() => _ConsultantHomeScreenState();
}

class _ConsultantHomeScreenState extends State<ConsultantHomeScreen> {
  @override
  final ScrollController _homeController = ScrollController();
  // String dropdownValueCity = 'Class-Seven';
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int currentIndex;
  bool isProfileUpdate = false;
  final _key = GlobalKey<SpringState>();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
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
                      builder: (context) => LoginScreen('', ''),
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
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: FadeAnimation(
          1.1,
          Scaffold(
            key: _drawerKey,
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
                  // new UserAccountsDrawerHeader(
                  //   decoration: BoxDecoration(
                  //     color: Colors.indigo[400],
                  //   ),
                  //   accountName: new Text(' home page'),
                  //   accountEmail: new Text('Respect Cabs'),
                  //   currentAccountPicture: CircleAvatar(
                  //     backgroundColor: Colors.white,
                  //     backgroundImage:
                  //         new ExactAssetImage("assets/images/ab.png"),
                  //     minRadius: 30,
                  //     maxRadius: 60,
                  //   ),
                  // ),
                  FadeAnimation(
                    1.2,
                    new UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.transparent),
                      accountName: new Text('Maoj Randeniya'),
                      accountEmail: new Text('manoj.randeniya@nexeyo.com'),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IndexPage()));
                      },
                    ),
                  ),
                  FadeAnimation(
                    1.4,
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.white),
                      title: Text(
                        'My Profile',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditScreen()));
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
                  FadeAnimation(
                    1.4,
                    ListTile(
                      leading: Icon(Icons.exit_to_app, color: Colors.white),
                      title: Text(
                        'Exit app',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        _onWillPop();
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => IndexPage()));
                      },
                    ),
                  ),
                ],
              ),
            )),
            // key: _drawerKey,
            // appBar: AppBar(
            //   iconTheme: new IconThemeData(color: AppTheme.primaryColor),
            //   elevation: 0,
            //   backgroundColor: Colors.transparent,
            //   actions: [
            //     Container(
            //       margin: EdgeInsets.only(
            //         right: 20,
            //       ),

            //     ),
            //   ],
            // ),
            body: <Widget>[
              SingleChildScrollView(
                controller: _homeController,
                child: FadeAnimation(
                  1.2,
                  Container(
                    height: size.height,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        // Image.asset(
                        //   "assets/images/Guest_Screen.png",
                        //   height: size.height,
                        //   width: size.width,
                        //   fit: BoxFit.fill,
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // SizedBox(
                            //   height: size.height * 0.01,
                            // ),
                            Container(
                              height: size.height * 0.1,
                              decoration: BoxDecoration(
                                gradient: purpleGradient,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _drawerKey.currentState.openDrawer();
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 16),
                                        child: SvgPicture.asset(
                                          'assets/icons/menu.svg',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: size.width * 0.55),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: 5, top: 20),
                                      child: Text(
                                        'Dr.Manoj',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // AppRoutes.goto(context, MyProfile());
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              right: 5, top: 20, bottom: 2),
                                          width: size.width * 0.10,
                                          height: size.width * 0.10,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 6.0,
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          child: Center(
                                              child: Icon(
                                            Icons.person,
                                            color: Colors.blue,
                                            size: 30,
                                          ))),
                                    ),
                                    // Image.asset(
                                    //   Assets.avtar,
                                    //   width: 30,
                                    //   height: 30,
                                    //   fit: BoxFit.contain,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue[700],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.08,
                              ),
                              child: Container(
                                width: size.width,
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.sentiment_very_dissatisfied,
                                      color: Colors.lightBlueAccent,
                                    ),
                                    Text(
                                      'Your Profile is not completed yet',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        color: Colors.lightBlue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.005,
                                    ),
                                    // Text(
                                    //   'give a test to see progress',
                                    //   textAlign: TextAlign.center,
                                    //   style: AppTheme.textStyle.heading1.copyWith(
                                    //       color: Colors.white,
                                    //       fontSize: AppFontSize.s20,
                                    //       fontWeight: FontWeight.w900),
                                    // ),
                                    Text(
                                      'Update your Profile to begin',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.005,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            slider(),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Center(
                              child: Container(
                                // height: 200,
                                width: size.width * 0.95,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Update Your Profile!!!',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Use the below button or go to your profile tab to finsh your profile update',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.05,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileUpdateScreen(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 200,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 6.0,
                                                ),
                                              ],
                                              gradient: new LinearGradient(
                                                  colors: [
                                                    const Color(0xFF3366FF),
                                                    Colors.deepPurple,
                                                  ],
                                                  begin: const FractionalOffset(
                                                      0.0, 0.0),
                                                  end: const FractionalOffset(
                                                      1.0, 0.0),
                                                  stops: [0.0, 1.0],
                                                  tileMode: TileMode.clamp),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                                child: Text(
                                              'Update Profile',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            )),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.03,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TimeAllocationHome(),
              Container(),
            ][currentIndex],
            floatingActionButton: Spring(
              key: _key,
              animStatus: (status) {},
              motion: Motion.Mirror,
              animType: AnimType.Bubble,
              animDuration: Duration(seconds: 5),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorWiseHomeScreen(),
                    ),
                  );
                },
                child: Icon(Icons.meeting_room),
                backgroundColor: Colors.red,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
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
                      Icons.calendar_today,
                      color: Colors.black,
                    ),
                    activeIcon: Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Allocate time",
                      style: TextStyle(color: Colors.white),
                    )),
                BubbleBottomBarItem(
                    backgroundColor: Colors.indigo,
                    icon: Icon(
                      Icons.notification_important,
                      color: Colors.black,
                    ),
                    activeIcon: Icon(
                      Icons.notification_important,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Notifications",
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
      ),
    );
  }

  Widget slider() {
    Size size = MediaQuery.of(context).size;
    return Container(
      //width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          aspectRatio: 16 / 9,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          //  onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
        items: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.red[300]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Image.asset(
                  //   // Assets.quizicon,
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Corona Updates',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.orange[400]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Image.asset(
                  //   Assets.Exams_bro,
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Corona Updates',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.green[400]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Image.asset(
                  //   Assets.fourms,
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Corona Updates',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const maths =
    '<svg xmlns="http://www.w3.org/2000/svg" width="88" height="88" viewBox="0 0 88 88"> <g id="Group_9462" data-name="Group 9462" transform="translate(-42 -175)"><rect id="Rectangle_580" data-name="Rectangle 580" width="88" height="88" rx="44" transform="translate(42 175)" fill="#b7d8e2"/><path id="Icon_metro-calculator" data-name="Icon metro-calculator" d="M21.023,3.856H5.646A3.084,3.084,0,0,0,2.571,6.931V22.309a3.084,3.084,0,0,0,3.075,3.075H21.023A3.084,3.084,0,0,0,24.1,22.309V6.931a3.084,3.084,0,0,0-3.075-3.075Zm0,12.3H5.646V13.082H21.023Zm24.6-12.3H30.25a3.084,3.084,0,0,0-3.075,3.075V46.912a3.084,3.084,0,0,0,3.075,3.075H45.627A3.084,3.084,0,0,0,48.7,46.912V6.931A3.084,3.084,0,0,0,45.627,3.856Zm0,27.679H30.25V28.459H45.627Zm0-9.226H30.25V19.233H45.627Zm-24.6,6.151H5.646a3.084,3.084,0,0,0-3.075,3.075V46.912a3.084,3.084,0,0,0,3.075,3.075H21.023A3.084,3.084,0,0,0,24.1,46.912V31.535a3.084,3.084,0,0,0-3.075-3.075Zm0,12.3H14.872v6.151H11.8V40.761H5.646V37.686H11.8V31.535h3.075v6.151h6.151v3.075Z" transform="translate(60.429 191.684)" fill="#04a3d4"/></g></svg>';
const physics =
    '<svg xmlns="http://www.w3.org/2000/svg" width="88" height="88" viewBox="0 0 88 88"> <g id="Group_9462" data-name="Group 9462" transform="translate(-42 -175)"><rect id="Rectangle_580" data-name="Rectangle 580" width="88" height="88" rx="44" transform="translate(42 175)" fill="#b8d1e5"/><path id="Icon_awesome-magnet" data-name="Icon awesome-magnet" d="M14.906,13.318H1.09A1.09,1.09,0,0,1,0,12.227V4.959A3.271,3.271,0,0,1,3.271,1.689h9.448A3.271,3.271,0,0,1,15.99,4.959v7.268a1.08,1.08,0,0,1-1.084,1.09Zm31.609-1.09V4.95A3.271,3.271,0,0,0,43.244,1.68H33.8A3.271,3.271,0,0,0,30.525,4.95v7.268a1.09,1.09,0,0,0,1.09,1.09H45.425a1.08,1.08,0,0,0,1.09-1.081Zm-14.9,4a1.09,1.09,0,0,0-1.09,1.09v4.724c0,11.638-14.536,11.62-14.536,0V17.315a1.09,1.09,0,0,0-1.09-1.09H1.1a1.09,1.09,0,0,0-1.09,1.1c.009,1.944.055,3.661,0,4.842,0,13.682,12.371,22.4,23.326,22.4S46.5,35.848,46.5,22.157c-.055-1.163-.018-3,0-4.833a1.09,1.09,0,0,0-1.09-1.1Z" transform="translate(63.045 201.101)" fill="#0984e3"/></g></svg>';
const chemistry =
    '<svg xmlns="http://www.w3.org/2000/svg" width="88" height="88" viewBox="0 0 88 88"> <g id="Group_9462" data-name="Group 9462" transform="translate(-42 -175)"><rect id="Rectangle_580" data-name="Rectangle 580" width="88" height="88" rx="44" transform="translate(42 175)" fill="#b7e0df"/><path id="Icon_metro-lab" data-name="Icon metro-lab" d="M45.437,38.452,31.077,14.525V4.834H32.53a1.453,1.453,0,0,0,0-2.906H18a1.453,1.453,0,1,0,0,2.906h1.453v9.691L5.095,38.452c-3.289,5.481-.75,9.966,5.643,9.966H39.794c6.392,0,8.932-4.485,5.643-9.966ZM12.964,30.984l9.4-15.66V4.834h5.811v10.49l9.4,15.66Z" transform="translate(60.957 194.253)" fill="#00cec9"/></g></svg>';
const biology =
    '<svg xmlns="http://www.w3.org/2000/svg" width="88" height="88" viewBox="0 0 88 88"> <g id="Group_9462" data-name="Group 9462" transform="translate(-42 -175)"><rect id="Rectangle_580" data-name="Rectangle 580" width="88" height="88" rx="44" transform="translate(42 175)" fill="#b7dcd5"/><path id="Icon_metro-microscope" data-name="Icon metro-microscope" d="M36.348,43.939a9.154,9.154,0,0,0,7.017-8.922,8.859,8.859,0,0,0-3.154-6.755,14.039,14.039,0,0,0,.18-2.167,14.766,14.766,0,0,0-5.948-11.9l2.974-2.974V8.251l2.974-2.974L37.417,2.3,34.443,5.277H31.469l-11.9,11.9-5.948,2.974V26.1L16.6,29.069h5.948l2.974-5.948,4.461-4.461A8.723,8.723,0,0,1,34.443,26.1a8.921,8.921,0,0,0-8.922,8.922H7.676v2.974H16.6a15.381,15.381,0,0,0,2.974,1.487v4.461H13.624L7.676,49.888H43.365l-5.948-5.948Zm-4.879-8.922a2.974,2.974,0,1,1,2.974,2.974A2.972,2.972,0,0,1,31.469,35.017Z" transform="translate(60.095 192.806)" fill="#00b894"/></g></svg>';
const english =
    '<svg xmlns="http://www.w3.org/2000/svg" width="88" height="88" viewBox="0 0 88 88"> <g id="Group_9462" data-name="Group 9462" transform="translate(-42 -175)"><rect id="Rectangle_580" data-name="Rectangle 580" width="88" height="88" rx="44" transform="translate(42 175)" fill="#ccc9e5"/><path id="Icon_material-g-translate" data-name="Icon material-g-translate" d="M44.4,10.386H23.72l-2-6.8H8.119A4.549,4.549,0,0,0,3.583,8.119V37.6a4.549,4.549,0,0,0,4.535,4.535H23.992l2.268,6.8H44.4A4.549,4.549,0,0,0,48.937,44.4V14.922A4.549,4.549,0,0,0,44.4,10.386ZM15.307,32.133a9.275,9.275,0,0,1,0-18.55,8.956,8.956,0,0,1,6.213,2.426l.159.136L18.89,18.822l-.136-.113a4.925,4.925,0,0,0-3.447-1.338,5.489,5.489,0,0,0,0,10.976,4.646,4.646,0,0,0,4.807-3.311H15.1V21.521H24.06l.023.159a7.12,7.12,0,0,1,.113,1.383c0,5.329-3.651,9.071-8.889,9.071Zm13.674-3.878a22.636,22.636,0,0,0,2.7,3.855l-1.225,1.2Zm1.746-1.723H28.482l-.7-2.358h9.048a17.418,17.418,0,0,1-3.538,6.213A20.821,20.821,0,0,1,30.727,26.532ZM46.669,44.4A2.274,2.274,0,0,1,44.4,46.669H28.528l4.535-4.535-1.837-6.281,2.086-2.086,6.077,6.1,1.655-1.655L34.9,32.133a19.8,19.8,0,0,0,4.354-7.96h2.88V21.815H33.879V19.457H31.521v2.358H27.076L24.4,12.654h20a2.274,2.274,0,0,1,2.268,2.268Z" transform="translate(57.744 193.105)" fill="#6c5ce7"/></g></svg>';

const shareButton =
    '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="157" height="49" viewBox="0 0 157 49"> <defs><linearGradient id="linear-gradient" x1="0.5" x2="0.5" y2="1" gradientUnits="objectBoundingBox"><stop offset="0" stop-color="#76b5ff"/><stop offset="1" stop-color="#49f"/></linearGradient></defs><g id="Button" transform="translate(0 -0.181)"><rect id="Rectangle" width="157" height="49" rx="5" transform="translate(0 0.181)" fill="url(#linear-gradient)"/><text id="Sign_in" data-name="Sign in" transform="translate(78 30.181)" fill="#fff" font-size="15" font-family="Poppins-Bold, Poppins" font-weight="700"><tspan x="-55.98" y="0">Share this App</tspan></text></g></svg>';

const rate =
    '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="157" height="49.343" viewBox="0 0 157 49.343"> <defs><linearGradient id="linear-gradient" x1="0.5" x2="0.5" y2="1" gradientUnits="objectBoundingBox"><stop offset="0" stop-color="#76b5ff"/><stop offset="1" stop-color="#49f"/></linearGradient></defs><g id="Veriy_Button_" data-name="Veriy Button " transform="translate(0 10.158)"><g id="Button" transform="translate(0 -10.158)"><rect id="Rectangle" width="157" height="49.343" rx="5" transform="translate(0 0)" fill="url(#linear-gradient)"/><text id="Sign_in" data-name="Sign in" transform="translate(78.979 28.778)" fill="#fff" font-size="13" font-family="Poppins-Bold, Poppins" font-weight="700"><tspan x="-27.43" y="0">Rate Us!</tspan></text></g></g></svg>';
