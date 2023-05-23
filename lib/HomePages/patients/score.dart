import 'package:course_pro/Model/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Sidepage.dart';

class Score extends StatefulWidget {
  const Score({Key? key}) : super(key: key);

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  List levels=[
    {'name':'Level 1', 'Score':7,},
    {'name':'Level 2', 'Score':5,},
    {'name':'Level 3', 'Score':3,},
    {'name':'Level 4', 'Score':10,},
    {'name':'Level 5', 'Score':9,},
    {'name':'Level 6', 'Score':10,},
    {'name':'Level 7', 'Score':8,},
    {'name':'Level 8', 'Score':10,},
    {'name':'Level 9', 'Score':10,},
    {'name':'Level 10', 'Score':6,},

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Patient Information",
          style: TextStyle(
              fontSize: 20.sp,
              color: CustomColor2.purple3,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: MaterialButton(
            onPressed: () {Navigator.pop(context);},
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_outlined,
                  size: 35,
                  color: CustomColor2.purple2,
                ))),
      ),
      body:
      Column(
        children: [
        Container(
          padding: EdgeInsets.all(2),
          height: 180,
          width: double.infinity,
          margin: EdgeInsets.only(left: 15, right: 15,top: 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [CustomColor2.purple1.withOpacity(.60), CustomColor2.blue2.withOpacity(.70)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              borderRadius: BorderRadius.circular(15)),
          child: Row(children: [
            Image.asset(
              "images/1.png",
              height: 140,
              width: 140,
            ),
            SizedBox(width: 30,),
            Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Ahmed Yather",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Mansoura",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                        color: Colors.white54,
                        child: Icon(
                          Icons.call,
                          color: Colors.deepPurpleAccent,
                          size: 40,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                        color: Colors.greenAccent,
                        child: Icon(
                          Icons.mail_lock,
                          color: Colors.purple,
                          size: 40,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                        color: Colors.grey,
                        child: Icon(
                          Icons.message,
                          color: Colors.yellow,
                          size: 40,
                        ))
                  ],
                )
              ],
            )
          ]),
        ),
        SizedBox(
          height: 20,
        ),
          DefaultTabController(

            length: 2,
            child: Column(
              children: [
                TabBar(
                  indicatorColor: CustomColor2.purple1,
                  indicatorSize:TabBarIndicatorSize.label,
                  labelColor: CustomColor2.purple3,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),
                  unselectedLabelStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 11.sp) ,

                  tabs: [
                    Tab(
                      child: Text(
                        "Current Score",
                      ),
                    ),
                    Tab(
                      child: Text("Previous Score",),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1.06.sw,
                  child: TabBarView(
                    children: [
                      GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3
                          ),
                          itemCount:levels.length ,
                          itemBuilder: (context,i){
                            return Container(
                              decoration: BoxDecoration(
                                //border: Border.all(color: CustomColor2.blue1),
                                borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                      colors: [CustomColor2.purple1.withOpacity(.20), CustomColor2.blue2.withOpacity(.20)],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter)
                              ),
                              margin: EdgeInsets.all(6),
                              alignment: Alignment.center,
                              child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${levels[i] ['name']}",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,color: CustomColor2.purple3
                                  ),),
                                  SizedBox(height: 20,),
                                  Text("Score: ${levels[i]['Score']}",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold,color: CustomColor2.purple1
                                  )),
                                ],
                              ),


                            );
                          }),
                      GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3
                          ),
                          itemCount:levels.length ,
                          itemBuilder: (context,i){
                            return Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [CustomColor2.purple1.withOpacity(.20), CustomColor2.blue2.withOpacity(.20)],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter),

                                  borderRadius: BorderRadius.circular(15)
                              ),
                              margin: EdgeInsets.all(6),
                              alignment: Alignment.center,
                              child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${levels[i] ['name']}",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,color: CustomColor2.purple3
                                  ),),
                                  SizedBox(height: 20,),
                                  Text("Score: ${levels[i]['Score']}",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold,color: CustomColor2.purple1
                                  )),
                                ],
                              ),


                            );
                          }),                    ],
                  ),
                ),

              ],
            ),
          )
            ],
          ),
    );
  }
}