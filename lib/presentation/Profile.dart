import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wardrobe/utils/StringValues.dart';

class Profile extends StatefulWidget {
  static String routeNamed = StringValues.PROFILE;
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading = false;
  bool isSequrity = false;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:Colors.white,
          leading: InkWell(
            child: Icon(Icons.arrow_back_ios , color: Colors.black),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0.0,
          title:   Text(StringValues.PROFILE,
                 style: TextStyle(
                   fontSize: 18.h,
                   fontWeight: FontWeight.bold , 
                   color: Colors.black
                 ),),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () async {
            setState(() {
              isLoading = true;
            });
            if (await canLaunchUrl(Uri.parse(StringValues.APP_URL))) {
              await launch(StringValues.APP_URL);
            } else {
              Fluttertoast.showToast(
                  msg: "OOps! Some Error Occur",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.h);
            }
            setState(() {
              isLoading = false;
            });
          },
          child: Icon(Icons.star),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(height : 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(StringValues.ENABLE_SECURITY,style: TextStyle(
                   fontSize: 16.h,
                   fontWeight: FontWeight.w500
                 )),
                    Switch(
                      value: false,
                      onChanged: (value) async {},
                      activeColor: Colors.black,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(StringValues.APP_VERSION,style: TextStyle(
                         fontSize: 14.h,
                         fontWeight: FontWeight.w400
                       )),
              ],
            ),
          ),
      ) , 
      );
    });
  }
}
