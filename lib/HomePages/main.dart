import 'package:course_pro/Authentection/Sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Authentection/certification.dart';
import 'Nav_class/Nav.dart';
import 'country.dart';
import 'doccode.dart';
import 'homepage.dart';
import 'firstscreen.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(200, 600),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w600,color: Colors.black),
              headline3: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600,color: Colors.black),
              headline2: TextStyle(fontSize: 12.sp,color: Colors.black54),


            )
          ),
          home: child,
        );
      },
      child:SignIn(),
    );
  }
}
