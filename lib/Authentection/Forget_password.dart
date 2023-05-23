
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Model/custom_color.dart';
import 'Sign_up.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  final _emailController = TextEditingController();

  void dispose(){
    _emailController.dispose();
  }
  Future passwordReset() async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
    } on FirebaseAuthException catch(e){
      print(e);
      showDialog(context: context, builder: (_)=>
          AlertDialog(
            content: Text(e.message.toString()),
          )
      );
    }
  }



  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  late String email;

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
                            "Forgot Password",
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline3,
                          ),
                        ),
                      ),
                      Form(
                          key: _formKey,
                          child: Column(children: [Padding(
                            padding: EdgeInsets.symmetric(horizontal: .1.sw),
                            child: TextFormField(
                              controller: _emailController,
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
                                          width: 2
                                      )
                                  ),
                                  hintText: "Enter your gmail",
                                  hintStyle: TextStyle(fontSize: 9.sp)),
                            ),
                          ),
                            SizedBox(
                              height: .04.sw,
                            ),
                          ],)),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.04.sw),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Do not have an account?  ",
                              style: TextStyle(
                                  fontSize: 9.sp),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SignUp()));
                              },
                              child: Text(
                                "Register Now",
                                style: TextStyle(
                                    color: CustomColor2.purple1, fontSize: 9.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: .04.sw),
                        child:
                        isLoading ? Center(child: CircularProgressIndicator(),)
                            : Stack(
                          children: [
                            Container(
                              height: .13.sw,
                              width: .74.sw,
                              child:
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                color: CustomColor2.blue2,
                                onPressed: passwordReset,
                                child: Text(
                                  "Reset",
                                  style: TextStyle(color: customColor.white),
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
                                    borderRadius: BorderRadius.circular(100)),
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
                height: 0.7.sw,
              ),
              SizedBox(height: 20,)
            ],
            ),
          )),
    );
  }
}