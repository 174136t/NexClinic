import 'package:doctor_consultation_app/Widgets/curved_widget.dart';
import 'package:doctor_consultation_app/constant.dart';
import 'package:doctor_consultation_app/screens/Consultant_Home/consultant_home_screen.dart';
import 'package:doctor_consultation_app/screens/Consultant_profile/edit_screen.dart';
import 'package:flutter/material.dart';

class ProfileUpdateScreen extends StatefulWidget {
  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/My_Profile_Pages.png',
                height: size.height,
                width: size.width,
                fit: BoxFit.fill,
              ),
              // Positioned(
              //   top: 0,
              //   right: 0,
              //   child: Image.asset(
              //     Assets.bgprofile,
              //     width: SizeConfig.widthMultiplier * 100,
              //     fit: BoxFit.contain,
              //   ),
              // ),
              Column(
                children: [
                  CurvedWidget(
                    child: Container(
                      height: size.height * 0.4,
                      decoration: BoxDecoration(gradient: purpleGradient),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ConsultantHomeScreen(''),
                                    ),
                                  );
                                },
                                child: Container(
                                    margin: EdgeInsets.only(left: 16, top: 16),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: 16),
                                      width: size.width * 0.26,
                                      height: size.width * 0.26,
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(0.0, 1.0), //(x,y)
                                              blurRadius: 6.0,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.person_add,
                                          size: 40,
                                        ),
                                        onPressed: () {},
                                      )),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          border:
                                              Border.all(color: Colors.blue)),
                                      margin:
                                          EdgeInsets.only(left: 74, top: 90),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.blue,
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Dr.Manoj Randeniya',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Dentist',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: Colors.white),
                                      ),
                                      // DropdownButton<String>(
                                      //   iconEnabledColor: Colors.white,
                                      //   items: <String>['A', 'B', 'C', 'D']
                                      //       .map((String value) {
                                      //     return new DropdownMenuItem<String>(
                                      //       value: value,
                                      //       child: new Text(value),
                                      //     );
                                      //   }).toList(),
                                      //   onChanged: (_) {},
                                      // ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: size.height * 0.05,
                  // ),
                  Container(
                    width: size.width,
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                    child: Text(
                      'Account Details',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    width: size.width,
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.phone_android,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '+94763529962',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Row(
                          children: [Text('')],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: size.width,
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Profile Details',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditScreen(),
                                ),
                              );
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color: Colors.blue)),
                                // margin:
                                //     EdgeInsets.only(left: 74, top: 90),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                )))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: size.width,
                    margin: EdgeInsets.only(left: size.width * 0.15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Manoj Randeniya',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: size.width,
                    margin: EdgeInsets.only(left: size.width * 0.15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.mail,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'manoj.randeniya@nexeyo.com',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: size.width,
                    margin: EdgeInsets.only(left: size.width * 0.15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '226, Madiwela',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: size.width,
                    margin: EdgeInsets.only(left: size.width * 0.15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.perm_identity,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '801545126V',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
