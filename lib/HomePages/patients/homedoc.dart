import 'package:course_pro/HomePages/patients/score.dart';
import 'package:course_pro/Model/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Sidepage.dart';

class PatientScreen extends StatefulWidget {
  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 17, right: 15),
            child: InkWell(
              onTap: () {},
              child: Text(
                "Edit",
                style: TextStyle(color: CustomColor2.purple2, fontSize: 14.sp),
              ),
            ),
          )
        ],
        title: Text(
          "Patient List",
          style: TextStyle(
              fontSize: 20.sp,
              color: CustomColor2.purple3,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: MaterialButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SidePage()));
            },
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  size: 35,
                  color: CustomColor2.purple2,
                ))),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Score()));
                  },

                   child:
                  ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(.04.sw),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(.02.sw),
                                gradient: LinearGradient(
                                    colors: [CustomColor2.purple1.withOpacity(.60), CustomColor2.blue2.withOpacity(.70)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Ahmed Yather',
                                      style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: .01.sw),
                                    const Text('Cairo'),
                                    SizedBox(height: .01.sw),
                                  ],
                                ),
                                SizedBox(width: 50,),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(70, 5, 0, 5),
                                  child: SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: Image.asset(
                                      'images/1.png',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      );
                    },

                  ) ,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
