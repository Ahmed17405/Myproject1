import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:course_pro/HomePages/Profile_page.dart';
import 'package:course_pro/HomePages/Sidepage.dart';
import 'package:course_pro/HomePages/calender.dart';
import 'package:course_pro/HomePages/favourite.dart';
import 'package:course_pro/HomePages/locationpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Tours.dart';
import '../country.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int ActiveIndex = 0;
  final bottomPages = [Tours(), Favourit(),Location(),  Calender(), Profile(),SidePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        height: .15.sw,
        elevation: .02.sw,
        color: Colors.white,
        shadowColor: Colors.teal[100],
        backgroundColor: Colors.white,
        style: TabStyle.fixedCircle,
        initialActiveIndex: 2,
        onTap: (int index) {
          setState(() {
            ActiveIndex = index;
          });
        },
        items: [
          TabItem(icon: Image.asset("images/icon1.png",color: Colors.black,)),
          TabItem(icon: Image.asset("images/icon2.png",color: Colors.black,)),
          TabItem(icon: Image.asset("images/icon3.png",fit: BoxFit.contain,)),
          TabItem(icon: Image.asset("images/icon4.png",color: Colors.black,)),
          TabItem(icon: Image.asset("images/icon5.png",color: Colors.black,)),
        ],
      ),
      body: bottomPages[ActiveIndex],
    );
  }
}
