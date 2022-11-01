import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wardrobe/service/PreferenceService.dart';
import 'package:wardrobe/utils/StringValues.dart';

class Wardrobe extends StatefulWidget {
  static String routeNamed = StringValues.WARDROBE;
  const Wardrobe({Key? key}) : super(key: key);
  @override
  State<Wardrobe> createState() => _WardrobeState();
}

class _WardrobeState extends State<Wardrobe> {
  final PreferenceService preferenceService = PreferenceService.getInstance();
  bool isLoading = false;
  bool isGallery = false;
  bool isCamera = false;
  String file = "assets/gallery.png";

  

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: 60.h,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                      GestureDetector(
                        onTap: () async {
                          try {
                            setState(() {
                              isCamera = false;
                            });
                            XFile? xFile = (await ImagePicker.platform
                                .getImage(source: ImageSource.camera));
                            if (xFile != null) {
                              String? getFiles =
                                  await preferenceService.getFilePath();
                              if (getFiles == null)
                                preferenceService.setFilePath(file + " ");
                              else
                                preferenceService
                                    .setFilePath(getFiles + file + " ");
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Please choose Image",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.h);
                            }
                          } catch (e) {
                            Fluttertoast.showToast(
                                msg: "OOps! Some error occur",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.h);
                          }
                          setState(() {
                            isCamera = false;
                          });
                        },
                        child: isCamera
                            ? CircularProgressIndicator(color: Colors.black)
                            : Container(
                                height: 48.h,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 4),
                                child: Image.asset(StringValues.CAMERA)),
                      ),
                      GestureDetector(
                        onTap: () async {
                          try {
                            setState(() {
                              isGallery = false;
                            });
                            XFile? xFile = (await ImagePicker.platform
                                .getImage(source: ImageSource.gallery));
                            if (xFile != null) {
                              file = xFile.path;
                              String? getFiles =
                                  await preferenceService.getFilePath();
                              if (getFiles == null)
                                preferenceService.setFilePath(file + " ");
                              else
                                preferenceService
                                    .setFilePath(getFiles + file + " ");
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Please choose Image",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.h);
                            }
                          } catch (e) {
                            Fluttertoast.showToast(
                                msg: "OOps! Some error occur",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.h);
                          }
                          setState(() {
                            isGallery = false;
                          });
                        },
                        child: isGallery
                            ? CircularProgressIndicator(color: Colors.black)
                            : Container(
                                height: 48.h,
                                padding: const EdgeInsets.only(
                                    left: 16, top: 9, bottom: 9),
                                child: Image.asset(StringValues.GALLERY)),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
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
          child: isLoading ? CircularProgressIndicator() : Icon(Icons.star),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 16, left: 16, bottom: 32, top: 16),
            child: Builder(builder: (context) {

              return Wrap(
                direction: Axis.horizontal,
                spacing: 8.0,
                runSpacing: 8.0,
                children: [Container()
                
                ],
              );
            }),
          ),
        ),
      ));
    });
  }
}
