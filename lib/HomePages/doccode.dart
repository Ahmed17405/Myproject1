import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_pro/Authentection/Sign_in.dart';
import 'package:course_pro/HomePages/homepage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Model/custom_color.dart';
class Doccode extends StatefulWidget {
  const Doccode({Key? key}) : super(key: key);

  @override
  State<Doccode> createState() => _DoccodeState();
}
class _DoccodeState extends State<Doccode>{

  Widget build(BuildContext context) {

    bool isLoading = false;

    final  sampleData = new TextEditingController();
    final dbRef = FirebaseDatabase.instance.ref();

    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [CustomColor2.purple1, CustomColor2.blue2],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 0.07.sh,
                ),
                Center(child: Image.asset('images/logo5.png',width: 100,height: 100,)),
                SizedBox(
                  height: 0.15.sw,
                ),
                Padding(
                  padding: EdgeInsets.only(left: .05.sw, right: .05.sw),
                  child: Container(
                    width: double.infinity,
                    height: 330,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white30,
                              offset: Offset(0, -.02.sh),
                              blurRadius: 70,
                              spreadRadius: -.01.sw,
                              blurStyle: BlurStyle.inner),
                          BoxShadow(
                              color: Colors.white30,
                              offset: Offset(0, -.05.sh),
                              blurRadius: 70,
                              spreadRadius: -.05.sw,
                              blurStyle: BlurStyle.inner)
                        ],
                        color: customColor.white,
                        borderRadius: BorderRadius.circular(.08.sw)),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 0.04.sw, bottom: .001.sw),
                          child: Center(
                            child: Text(
                              "Enter Code  ",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 0.03.sw, bottom: .1.sw),
                          child: Center(
                            child: SizedBox(
                              height: 70,
                              width: 150,
                              child: TextFormField(
                                controller: sampleData,

                                style: TextStyle(color: CustomColor2.purple3,fontWeight: FontWeight.bold,fontSize: 30.sp),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: .04.sw),
                          child:Stack(
                            children: [
                              Container(
                                height: .13.sw,
                                width: .74.sw,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(50)),
                                  color: CustomColor2.blue2,
                                  onPressed: () {
                                    Map<String,String> data = {"Doctor Code":sampleData.text};
                                    dbRef.push().set(data);
                                    print(data);
                                    Navigator.push(context, MaterialPageRoute(builder: (_)=>SignIn()));

                                  },
                                  child: isLoading?
                                  Text(
                                    "please wait",
                                    style: TextStyle(
                                        color: customColor.white),
                                  ):
                                  Text(
                                    "Save",
                                    style: TextStyle(
                                        color: customColor.white),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: Container(
                                  height: .13.sw,
                                  width: .13.sw,
                                  decoration: BoxDecoration(
                                      color: CustomColor2.purple1,
                                      borderRadius:
                                      BorderRadius.circular(100)),
                                  child: Icon(
                                    Icons.arrow_forward_outlined,
                                    size: 27,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.35.sw,
                ),

              ],
            ),
          )),
    );;
  }
  void Insertdata (String doctorcode){

  }

}
