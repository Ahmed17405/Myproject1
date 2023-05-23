import 'dart:async';
import 'dart:convert';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:course_pro/Model/custom_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import '../HomePages/Nav_class/Nav.dart';
import '../HomePages/patients/homedoc.dart';
import 'Forget_password.dart';
import 'Sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool showPassword = true;
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
            child: Column(
              children: [
                SizedBox(
                  height: 0.07.sh,
                ),
                Center(child: Image.asset('images/splash.png',width: 180,height: 90,),),
                SizedBox(
                  height: 0.15.sw,
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
                          padding:
                              EdgeInsets.only(top: 0.04.sw, bottom: .001.sw),
                          child: Center(
                            child: Text(
                              "Sign In",
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
                                  height: .04.sw,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: .1.sw),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter Valid Password";
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
                                            icon: showPassword
                                                ? Icon(Icons.visibility_off,color: Colors.black45,)
                                                : Icon(Icons.visibility,color: CustomColor2.purple1,)),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: CustomColor2.purple1,
                                                width: 2)),
                                        hintText: "Password",
                                        hintStyle: TextStyle(fontSize: 9.sp)),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 0.04.sw),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ForgetPassword()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: .45.sw),
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(
                                    color: CustomColor2.purple1,
                                    fontSize: 10.sp),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: .04.sw),
                          child:
                              Stack(
                                  children: [
                                    Container(
                                      height: .13.sw,
                                      width: .74.sw,
                                      child: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),

                                        color:CustomColor2.blue2,
                                        onPressed: () async{
                                          try{
                                            var user =  await auth.signInWithEmailAndPassword(email: email, password: password);
                                            if(user != null){
                                              Navigator.push(context, MaterialPageRoute(builder: (_)=>PatientScreen()));
                                            }
                                          }catch(e){
                                            print(e);
                                              isLoading = true;

                                          }
                                        },
                                        child:
                                        isLoading?
                                        Text(
                                          "Please Wait ..",
                                          style: TextStyle(
                                              color: Colors.white),
                                        ):
                                        Text(
                                          "Sign in",
                                          style: TextStyle(
                                              color: Colors.white),
                                        )
                                        ,
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: Container(
                                        height: .13.sw,
                                        width: .13.sw,
                                        decoration: BoxDecoration(
                                            color:
                                            isLoading?CustomColor2.blue2:
                                            CustomColor2.purple1,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child:
                                        isLoading?
                                         CircularProgressIndicator(
                                           color: CustomColor2.purple1,
                                         ) :
                                        Icon(
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
                  height: 0.35.sw,
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
                      "Don’t have an account?",
                      style:
                          TextStyle(color: customColor.white, fontSize: 9.sp),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUp()));
                      },
                      child: Text(
                        " Sign up",
                        style: TextStyle(
                            color: CustomColor2.purple1, fontSize: 9.sp),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
