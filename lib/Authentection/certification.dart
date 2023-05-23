import 'dart:io';
import 'package:course_pro/HomePages/doccode.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Model/custom_color.dart';
import 'Sign_up.dart';

class Certify extends StatefulWidget {
  const Certify({Key? key}) : super(key: key);

  @override
  State<Certify> createState() => _CertifyState();
}

class _CertifyState extends State<Certify> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  bool isLoading = false;

  Future Uploadfile() async{
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask= ref.putFile(file);
      isLoading = true;
    });
    final snapshot = await uploadTask!.whenComplete(() => null);
    final urlDownload = await snapshot.ref.getDownloadURL();

    print("Download Link: $urlDownload");

    setState(() {
      uploadTask= null;
      isLoading = false;
      Navigator.push(context, MaterialPageRoute(builder: (_)=>Doccode()));
    });

  }
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }


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
                          padding:
                              EdgeInsets.only(top: 0.04.sw, bottom: .001.sw),
                          child: Center(
                            child: Text(
                              "Certification",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: .05.sw,
                        ),
                        Center(
                            child: Column(
                          children: [
                            if (pickedFile != null)
                              SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Image.file(File(pickedFile!.path!)))
                            else
                              Icon(
                                Icons.upload_file_rounded,
                                size: 70,
                                color:Colors.amber,
                              ),
                          ],
                        )),
                        SizedBox(
                          height: .05.sw,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: CustomColor2.blue2,
                          onPressed: selectFile,
                          child: Text(
                            "Select File",
                            style: TextStyle(color: Colors.white),
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
                                        color: CustomColor2.blue2,

                                        onPressed: Uploadfile,
                                        child: isLoading?
                                        Text(
                                          "please wait",
                                          style: TextStyle(
                                              color: customColor.white),
                                        ):
                                        Text(
                                          "Upload",
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
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.7.sw,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )),
    );
  }

}
