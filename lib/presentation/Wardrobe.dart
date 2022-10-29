import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wardrobe/presentation/Profile.dart';
import 'package:wardrobe/utils/StringValues.dart';

class Wardrobe extends StatefulWidget {
  static String routeNamed = StringValues.WARDROBE;
  const Wardrobe({Key? key}) : super(key: key);
  @override
  State<Wardrobe> createState() => _WardrobeState();
}

class _WardrobeState extends State<Wardrobe> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 60.h,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          height: 48.h,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Image.asset(StringValues.LOGO_96)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          height: 48.h,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: Image.asset(StringValues.CAMERA)),
                      InkWell(
                        onTap: () {
                            Navigator.pushNamed(context, Profile.routeNamed);
                        },
                        child: Container(
                            height: 44.h,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Image.asset(StringValues.USER)),
                      )
                    ],
                  ),
                ],
              ),
            )),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [

            ],
          ),
        ),
      ));
    });
  }
}
