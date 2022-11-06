import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wardrobe/presentation/FirstPage.dart';
import 'package:wardrobe/presentation/Wardrobe.dart';
import 'package:wardrobe/utils/StringValues.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit( 
      builder: (BuildContext context, Widget? child) { return MaterialApp(
        title: StringValues.APP_NAME,
        initialRoute: FirstPage.routeNamed,
        routes: {
            FirstPage.routeNamed: (BuildContext context) => FirstPage(),
            Wardrobe.routeNamed: (BuildContext context) => Wardrobe(),
        },
        debugShowCheckedModeBanner: false
        );
       });
  }
}

