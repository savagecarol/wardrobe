import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:wardrobe/utils/StringValues.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 120.h,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Lottie.asset(
              StringValues.BOY_LOTTIE,
              animate: true),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Container(
                  height: 140.h,
                  width: 140.h,
                  child: Image.asset(StringValues.LOGO)) ,                 
            ],
          ),
        )
      ),
    ));
  }
}
