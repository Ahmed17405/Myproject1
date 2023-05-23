import 'package:course_pro/HomePages/Sidepage.dart';
import 'package:flutter/material.dart';
import 'package:course_pro/Model/custom_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Sidepage.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColor.white1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: customColor.white1,
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
          "Profile",
          style: TextStyle(fontSize: 20.sp, color: CustomColor2.purple3,fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: MaterialButton(
            highlightColor: customColor.white,
            splashColor: customColor.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>SidePage()));
            },
            child:Icon(Icons.menu,size: 35,color: CustomColor2.purple2,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: .09.sw,
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
                      color: Colors.white,
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
                              "images/1.png",fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  ),
                  Positioned(
                      top: 110,
                      right: 6,
                      child: CircleAvatar(
                        backgroundColor: customColor.blue,
                        child: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: .1.sw,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                readOnly: true,
                initialValue: "Ahmed22889911@Gmail.com",
                style: TextStyle(color: CustomColor2.purple3),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: CustomColor2.purple2),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black26
                    )
                  )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                readOnly: true,
                initialValue: "556122",
                style: TextStyle(color: CustomColor2.purple3),
                decoration: InputDecoration(
                    labelText: "Code",
                    labelStyle: TextStyle(color: CustomColor2.purple2),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black26
                        )
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                readOnly: true,
                initialValue: "01268455980",
                style: TextStyle(color: CustomColor2.purple3),
                decoration: InputDecoration(
                    labelText: "Phone",
                    labelStyle: TextStyle(color: CustomColor2.purple2),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black26
                        )
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                readOnly: true,
                initialValue: "Male",
                style: TextStyle(color: CustomColor2.purple3),
                decoration: InputDecoration(
                    labelText: "Gender",
                    labelStyle: TextStyle(color: CustomColor2.purple2),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black26
                        )
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                readOnly: true,
                initialValue: "2/8/2000",
                style: TextStyle(color: CustomColor2.purple3),
                decoration: InputDecoration(
                    labelText: "Date of Birth",
                    labelStyle: TextStyle(color: CustomColor2.purple2),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black26
                        )
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                readOnly: true,
                initialValue: "Mansoura",
                style: TextStyle(color: CustomColor2.purple3),
                decoration: InputDecoration(
                    labelText: "Address",
                    labelStyle: TextStyle(color: CustomColor2.purple2),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black26
                        )
                    )
                ),
              ),
            ),
            SizedBox(height: 20,)
          ],

        ),
      ),
    );
  }
}
