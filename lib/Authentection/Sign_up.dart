import 'dart:convert';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:course_pro/Authentection/certification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:course_pro/Model/custom_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

import '../HomePages/Nav_class/Nav.dart';
import '../api/SignupResponse.dart';
import 'Sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool showPassword = true;
  bool showPassword2 = true;
  bool value = false;
  bool isLoading = false;
  late String email ;
  late String password ;

  @override
  Widget build(BuildContext context) {
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
            child: Column(children: [
              SizedBox(
                height: 0.06.sh,
              ),
              Center(child: Image.asset('images/splash.png',width: 180,height: 90,),),
              SizedBox(
                height: 0.09.sw,
              ),
              Padding(
                padding: EdgeInsets.only(left: .05.sw, right: .05.sw),
                child: Container(
                  width: double.infinity,
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
                      Padding(
                        padding: EdgeInsets.only(top: 0.04.sw, bottom: .001.sw),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: .1.sw),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: CustomColor2.purple1,
                                              width: 2)),
                                      hintText: "Name",
                                      hintStyle: TextStyle(fontSize: 9.sp)),
                                ),
                              ),
                              SizedBox(
                                height: .03.sw,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: .1.sw),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !value.contains("@")) {
                                      return "Enter Valid Email";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      email = value!;
                                    });
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: CustomColor2.purple1,
                                              width: 2)),
                                      hintText: "Email",
                                      hintStyle: TextStyle(fontSize: 9.sp)),
                                ),
                              ),
                              SizedBox(
                                height: .03.sw,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: .1.sw),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Password";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      password = value!;
                                    });
                                  },
                                  obscureText: showPassword,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              showPassword = !showPassword;
                                            });
                                          },
                                          icon:
                                          showPassword?
                                          Icon(
                                              Icons.visibility_off,color: Colors.black45,):
                                      Icon(Icons.visibility,color: CustomColor2.purple1,)
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: CustomColor2.purple1,
                                              width: 2)),
                                      hintText: "Password",
                                      hintStyle: TextStyle(fontSize: 9.sp)),
                                ),
                              ),
                              SizedBox(
                                height: .03.sw,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: .1.sw),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Password again";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      password = value!;
                                    });
                                  },
                                  obscureText: showPassword2,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              showPassword2 = !showPassword2;
                                            });
                                          },
                                          icon:
                                          showPassword2?
                                          Icon(
                                            Icons.visibility_off,color: Colors.black45,):
                                          Icon(Icons.visibility,color: CustomColor2.purple1,)
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: CustomColor2.purple1,
                                              width: 2)),
                                      hintText: "Confirm Password",
                                      hintStyle: TextStyle(fontSize: 9.sp)),
                                ),
                              ),
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 0.06.sw),
                        child: Row(
                          children: [
                            Checkbox(
                                activeColor: CustomColor2.purple1,
                                value: value,
                                onChanged: (changed) {
                                  setState(() {
                                    value = changed!;
                                  });
                                }),
                            Text(
                              "I agree the ",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 9.sp),
                            ),
                            Text(
                              "Terms & Conditions",
                              style: TextStyle(
                                  color: CustomColor2.purple1, fontSize: 9.sp),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: .03.sw,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: .04.sw),
                        child: isLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Stack(
                                children: [
                                  Container(
                                    height: .13.sw,
                                    width: .74.sw,
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      color: CustomColor2.blue2,
                                      onPressed: () async{
                                        try{
                                          var user = await auth.createUserWithEmailAndPassword(email: email, password: password);
                                        }catch(e){
                                          print(e);
                                        };
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          SignUp();
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => Certify()));
                                        }
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style:
                                            TextStyle(color: customColor.white),
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
                      ),
                      SizedBox(
                        height: .02.sw,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 0.02.sw,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(.03.sw),
                    child: GoogleAuthButton(
                      onPressed: () {},
                      style: AuthButtonStyle(
                        buttonType: AuthButtonType.icon,
                        iconType: AuthIconType.secondary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(.03.sw),
                    child: FacebookAuthButton(
                      onPressed: () {},
                      style: AuthButtonStyle(
                        buttonType: AuthButtonType.icon,
                        iconType: AuthIconType.secondary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(.03.sw),
                    child: TwitterAuthButton(
                      onPressed: () {},
                      style: AuthButtonStyle(
                        buttonType: AuthButtonType.icon,
                        iconType: AuthIconType.secondary,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: customColor.white, fontSize: 9.sp),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => SignIn()));
                    },
                    child: Text(
                      " Login",
                      style: TextStyle(
                          color: CustomColor2.purple1, fontSize: 9.sp),
                    ),
                  )
                ],
              ),
            ]),
          )),
    );
  }







  // Future SignUp() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   Response registerResponse =
  //       await post(Uri.parse("http://alcaptin.com/api/register"), body: {
  //     "first_name": "Ahmed",
  //     "last_name": "elshora",
  //     "age": "28",
  //     "gender": "Male",
  //     "email": email,
  //     "password": password,
  //   });
  //
  //   dynamic convertedJson = jsonDecode(registerResponse.body);
  //
  //   if (registerResponse.statusCode == 200) {
  //     Register userData = Register.fromJson(convertedJson);
  //     Navigator.push(context, MaterialPageRoute(builder: (_) => Nav()));
  //   } else {
  //     print(convertedJson["message"]);
  //   }
  //
  //   setState(() {
  //     isLoading = false;
  //   });
  // }
}
