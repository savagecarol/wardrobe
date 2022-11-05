import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_stickers/flutter_whatsapp_stickers.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
