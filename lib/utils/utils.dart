import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_stickers/flutter_whatsapp_stickers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';


  String identifier = "1";
  String name = "Savagecarol";
  String publisher = "Savagecarol Stickers";
  String publisher_email = "karthiksharma1411@gmail.com";
  String publisher_website = "https://savagecarol.github.io/";
  String privacy_policy_website =
      "https://www.freeprivacypolicy.com/live/3c75d84c-10e4-427e-8ee3-58fe31cdb53d";
  String license_agreement_website = "";
  String image_data_version = "1";
  String app_name = "http://play.google.com/store/apps/details?id=com.savagecarol.2048";


void createLocalFile() async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  Directory stickersDirectory = Directory("$dir/sticker_packs");
  if (!await stickersDirectory.exists()) {
    await stickersDirectory.create();
  }
  var StringContent = {
    "android_play_store_link":
       app_name,
    "ios_app_store_link": "",
    "sticker_packs": [
      {
        "identifier": identifier,
        "name": name,
        "publisher": publisher,
        "tray_image_file": "1.png",
        "publisher_email": publisher_email,
        "publisher_website": publisher_website,
        "privacy_policy_website":
           privacy_policy_website,
        "license_agreement_website": "",
        "image_data_version": "1",
        "stickers": [
          {
            "image_file": "1.webp",
            "emojis": ["", ""]
          }
        ]
      }
    ]
  };
  File jsonFile = File('$dir/sticker_packs/sticker_packs.json');
  String content = jsonEncode(StringContent);
  jsonFile.writeAsStringSync(content);
}

Future<void> processResponse(
    {required StickerPackResult action,
    required bool result,
    required String error}) async {
  print("_listener");
  print(action);
  print(result);
  print(error);
  switch (action) {
    case StickerPackResult.SUCCESS:
    case StickerPackResult.ADD_SUCCESSFUL:
    case StickerPackResult.ALREADY_ADDED:
      Fluttertoast.showToast(
          msg: "Added SuccessFully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white);

      break;
    case StickerPackResult.CANCELLED:
      Fluttertoast.showToast(
          msg: "Cancelled Sticker Pack Install",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white);
      break;
    case StickerPackResult.ERROR:
      Fluttertoast.showToast(
          msg: error,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white);
      break;
    case StickerPackResult.UNKNOWN:
      Fluttertoast.showToast(
          msg: "Unknown Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white);
      break;
  }
}
