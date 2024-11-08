import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void successToast({required String msg, required dynamic context}) {
  showToast(msg, context: context);
}

void errorToast({required String msg, required dynamic context}) {
  showToast(msg, context: context);
}

void infoToast({required String msg, required dynamic context}) {
  showToast(msg, context: context);
}

//
// void successToast({required String msg}) {
//   Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.greenAccent,
//       textColor: Colors.white,
//       fontSize: 16.0);
// }
//
// void errorToast({required String msg}) {
//   Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.redAccent,
//       textColor: Colors.white,
//       fontSize: 16.0);
// }
//
// void infoToast({required String msg}) {
//   Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.grey,
//       textColor: Colors.white,
//       fontSize: 16.0);
// }
