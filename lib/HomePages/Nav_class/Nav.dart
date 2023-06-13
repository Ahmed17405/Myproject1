
import 'package:course_pro/HomePages/Profile_page.dart';
import 'package:course_pro/HomePages/Sidepage.dart';
import 'package:course_pro/HomePages/locationpage.dart';
import 'package:course_pro/HomePages/patients/firebaselist.dart';
import 'package:course_pro/Model/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../patients/homedoc.dart';
import '../patients/patientdetails/Lvls_Deatails.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int ActiveIndex = 0;
  final bottomPages = [FirebaseList(),  lvls_details(), Profile(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SnakeNavigationBar.color(
        elevation: .03.sw,
        height: .15.sw,

        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        shadowColor: CustomColor2.purple2,
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,


        padding: EdgeInsets.all(10),


        snakeViewColor:  CustomColor2.purple1,
        selectedItemColor:Colors.redAccent,
        unselectedItemColor: Colors.blueGrey,


        showUnselectedLabels: false,
        showSelectedLabels: true,

        currentIndex: ActiveIndex,
        onTap: (int index) {
          setState(() {
            ActiveIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home_outlined,color: Colors.black,size: 35,)),
          BottomNavigationBarItem(icon: Icon(Icons.table_rows,color: Colors.black,size: 35,)),
          BottomNavigationBarItem(icon:Icon(Icons.person_outline_sharp,color: Colors.black,size: 35,)),
        ],
      ),

      body: bottomPages[ActiveIndex],
    );
  }
}
