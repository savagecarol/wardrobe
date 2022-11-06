import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_whatsapp_stickers/flutter_whatsapp_stickers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wardrobe/service/PreferenceService.dart';
import 'package:wardrobe/utils/StringValues.dart';
import 'package:wardrobe/utils/utils.dart';

class Wardrobe extends StatefulWidget {
  static String routeNamed = StringValues.WARDROBE;
  const Wardrobe({Key? key}) : super(key: key);
  @override
  State<Wardrobe> createState() => _WardrobeState();
}

class _WardrobeState extends State<Wardrobe> {
  final WhatsAppStickers _waStickers = WhatsAppStickers();
  final PreferenceService preferenceService = PreferenceService.getInstance();
  bool isRatingLoading = false;
  bool isGallery = false;
  bool isCamera = false;
  bool isLoading = false;
  String file = "";
  late Offset _tapDownPosition;


  @override
  void initState() {
    super.initState();
    getImages();
  }

  getImages() async {
    setState(() {
      isLoading = true;
    });
    file = await preferenceService.getFilePath();
    print(file);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return SafeArea(
          child: isLoading
              ? Scaffold(
                  backgroundColor: Colors.white,
                  body: Container(
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    ),
                  ),
                )
              : Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                      toolbarHeight: 60.h,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      title: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                    height: 48.h,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
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
                                          .getImage(
                                              source: ImageSource.camera));
                                      if (xFile != null) {
                                        if (file == null)
                                          preferenceService
                                              .setFilePath(xFile.path + ",");
                                        else
                                          preferenceService.setFilePath(
                                              file + xFile.path + ",");
                                        file = await preferenceService
                                            .getFilePath();

                                        file = await preferenceService
                                            .getFilePath();
                                        print(file);
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
                                      ? CircularProgressIndicator(
                                          color: Colors.black)
                                      : Container(
                                          height: 48.h,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 4),
                                          child:
                                              Image.asset(StringValues.CAMERA)),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    try {
                                      setState(() {
                                        isGallery = false;
                                      });
                                      XFile? xFile = (await ImagePicker.platform
                                          .getImage(
                                              source: ImageSource.gallery));
                                      if (xFile != null) {
                                        if (file == null)
                                          preferenceService
                                              .setFilePath(xFile.path + ",");
                                        else
                                          preferenceService.setFilePath(
                                              file + xFile.path + ",");
                                        file = await preferenceService
                                            .getFilePath();
                                        print(file);
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
                                      ? CircularProgressIndicator(
                                          color: Colors.black)
                                      : Container(
                                          height: 48.h,
                                          padding: const EdgeInsets.only(
                                              left: 16, top: 9, bottom: 9),
                                          child: Image.asset(
                                              StringValues.GALLERY)),
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
                        isRatingLoading = true;
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
                        isRatingLoading = false;
                      });
                    },
                    child: isRatingLoading
                        ? CircularProgressIndicator()
                        : Icon(Icons.star),
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 16, left: 16, bottom: 32, top: 16),
                      child: Builder(builder: (context) {
                        List<Widget> x = [];
                        List p = file.split(",");
                        int i = 0;
                        p.forEach((e) {
                          x.add(WrapItem(e, i));
                          i++;
                        });
                        x.removeAt(p.length - 1);
                        return file == ""
                            ? Container(
                                height: ScreenUtil().screenHeight / 2 + 120,
                                child: Center(
                                  child: Text("Please Insert Image",
                                      style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w600)),
                                ),
                              )
                            : Wrap(
                                direction: Axis.horizontal,
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: x,
                              );
                      }),
                    ),
                  ),
                ));
    });
  }

  Widget WrapItem(String image, int i) {
    return image == ""
        ? Container()
        : GestureDetector(
            onTapDown: (TapDownDetails details) {
              _tapDownPosition = details.globalPosition;
            },
            onLongPress: () async {
              double? height = Overlay.of(context)?.context.size?.height;
              double? width = Overlay.of(context)?.context.size?.width;
              showMenu(
                  items: <PopupMenuEntry>[
                    PopupMenuItem(
                      child: GestureDetector(
                        onTap: () {
                          try {
                            _waStickers.addStickerPack(
                              packageName: WhatsAppPackage.Consumer,
                              stickerPackIdentifier: "1",
                              stickerPackName: "Cute Paandoo",
                              listener: (action, status, {error = ""}) =>
                                  processResponse(
                                action: action,
                                result: status,
                                error: error,
                              ),
                            );
                          } catch (e) {
                            Fluttertoast.showToast(
                                msg: "Oops! Some Error Occur",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.h);
                          }

                          Navigator.pop(context);
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.share),
                            Text("Whatsapp"),
                          ],
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          List r = file.split(",");
                          r.removeAt(i);
                          file = r.join(',') + ",";
                          await preferenceService.setFilePath(file);
                          print(file);
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.delete),
                            Text("Delete"),
                          ],
                        ),
                      ),
                    )
                  ],
                  context: context,
                  position: RelativeRect.fromLTRB(
                    _tapDownPosition.dx,
                    _tapDownPosition.dy,
                    width! - _tapDownPosition.dx,
                    height! - _tapDownPosition.dy,
                  ));
            },
            child: Container( height : 120 , width : 120 , child: Image.file(File(image))),
          );
  }
}
