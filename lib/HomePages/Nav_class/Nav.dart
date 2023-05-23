// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:course_pro/HomePages/Profile_page.dart';
// import 'package:course_pro/HomePages/Sidepage.dart';
// import 'package:course_pro/HomePages/calender.dart';
// import 'package:course_pro/HomePages/locationpage.dart';
// import 'package:course_pro/Model/custom_color.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../country.dart';
// import '../patients/homedoc.dart';
//
// class Nav extends StatefulWidget {
//   const Nav({Key? key}) : super(key: key);
//
//   @override
//   State<Nav> createState() => _NavState();
// }
//
// class _NavState extends State<Nav> {
//   int ActiveIndex = 0;
//   final bottomPages = [PatientScreen(),  Levels(), Profile(),];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: ConvexAppBar(
//         height: .15.sw,
//         elevation: .02.sw,
//         color: Colors.white,
//         shadowColor: CustomColor2.purple2,
//         backgroundColor: Colors.white,
//         style: TabStyle.fixedCircle,
//         initialActiveIndex: 2,
//         onTap: (int index) {
//           setState(() {
//             ActiveIndex = index;
//           });
//         },
//         items: [
//           TabItem(icon:Icon(Icons.home_outlined,color: Colors.black,size: 35,)),
//           TabItem(icon: Icon(Icons.ad_units_sharp,color: Colors.black,size: 50,)),
//           TabItem(icon:Icon(Icons.person_outline_sharp,color: Colors.black,size: 35,)),
//         ],
//       ),
//
//       body: bottomPages[ActiveIndex],
//     );
//   }
// }
