import 'dart:async';
import 'package:course_pro/Authentection/Sign_in.dart';
import 'package:course_pro/HomePages/patients/homedoc.dart';
import 'package:course_pro/Model/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class splashScreens extends StatefulWidget {
  const splashScreens({Key? key}) : super(key: key);

  @override
  State<splashScreens> createState() => _splashScreensState();
}

class _splashScreensState extends State<splashScreens> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => SignIn())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [CustomColor2.purple1, CustomColor2.blue2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/splash.png',width: 180,height: 90,),
              Image.asset('images/text.png',width: 150,height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
