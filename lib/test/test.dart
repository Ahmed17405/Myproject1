import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';

import '../api/PlacesResponse.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  bool isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tours();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(),
        body: ListView.builder(
            itemCount: posts.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return Padding(
                  padding:
                  EdgeInsets.only(top: .035.sw, left: .02.sw),
                  child: Text("${posts[i]['title']}",
                    //item.name,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600),
                  ));
            }));
  }
  List posts = [];
  Future tours() async {
    Response loginResponse =
        await post(Uri.parse("https://datausa.io/api/data?drilldowns=Nation&measures=Population")
    );
    dynamic jsondecode = jsonDecode(loginResponse.body);
    posts.addAll(jsondecode);
    print(posts);
  }
// Future tours() async {
//   setState(() {
//     isloading = true;
//   });
//   Response loginResponse =
//   await get(Uri.parse("http://alcaptin.com/api/places"), headers: {
//     "Authorization": "Bearer $widget.token",
//   });
//
//   dynamic jsondecode = jsonDecode(loginResponse.body);
//
//   if (loginResponse.statusCode == 200) {
//     PlacesResponse userData = PlacesResponse.fromJson(jsondecode);
//     List <PlacesResponse> places =[];
//     for(var item in jsondecode){
//       places.add(PlacesResponse.fromJson(item));
//     }
//     return places;
//     //Navigator.push(context, MaterialPageRoute(builder: (_) => Country()));
//   } else {
//     // print(jsondecode["message"]);
//     null;
//   }
//   setState(() {
//     isloading = false;
//   });
// }

}
