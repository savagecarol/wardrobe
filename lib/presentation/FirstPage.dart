import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:wardrobe/presentation/Wardrobe.dart';
import 'package:wardrobe/utils/StringValues.dart';

class FirstPage extends StatefulWidget {
  static String routeNamed = StringValues.FIRST_PAGE;
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 10);
    Timer(duration, route);
  }

  route() {
    Navigator.popAndPushNamed(context, Wardrobe.routeNamed);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return SafeArea(
          child: Scaffold(
          backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 120.h,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Lottie.asset(StringValues.BOY_LOTTIE, animate: true),
          ),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 150.h, child: Image.asset(StringValues.LOGO)),
            ],
          ),
        )),
      ));
    });
  }
}
