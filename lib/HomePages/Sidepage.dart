import 'package:course_pro/HomePages/locationpage.dart';
import 'package:course_pro/Model/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Profile_page.dart';

class SidePage extends StatefulWidget {
  const SidePage({Key? key}) : super(key: key);

  @override
  State<SidePage> createState() => _SidePageState();
}

class _SidePageState extends State<SidePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColor.white1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: .13.sw,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset.zero,
                                  blurRadius: 8,
                                  color: Colors.black45)
                            ],
                            color: CustomColor2.purple3,
                          ),
                          width: .415.sw,
                          height: .415.sw,
                        ),
                        Positioned(
                          top: 5,
                          left: 5,
                          bottom: 5,
                          right: 5,
                          child: Container(
                            width: .40.sw,
                            height: .40.sw,
                            child: CircleAvatar(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: Image.asset(
                                  "images/negan1.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 110,
                            right: 6,
                            child: CircleAvatar(
                              backgroundColor: CustomColor2.blue1,
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: CustomColor2.purple2,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 8),
                    child: Text(
                      "Mahmoud Bakr",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 27),
                    ),
                  ),
                  Text("Ahmed22889911@Gmail.com",
                      style: TextStyle(color: Colors.black26, fontSize: 16)),
                  SizedBox(
                    height: .2.sw,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        //border: Border.all(color: CustomColor2.blue1),
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                            colors: [
                              CustomColor2.purple1.withOpacity(.20),
                              CustomColor2.blue2.withOpacity(.20)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    height: 250,
                    margin: EdgeInsets.all(6),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your Code :",
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              color: CustomColor2.purple3),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("556212",
                            style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                                color: CustomColor2.purple1)),
                      ],
                    ),
                  ),
                  Divider(
                    indent: .06.sw,
                    endIndent: .06.sw,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
