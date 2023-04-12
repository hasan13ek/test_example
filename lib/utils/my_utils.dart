import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyUtils{
  static getMyToast({required String message}) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    fontSize: 16.0,
  );

}
InputDecoration getInputDecoration({required String label}) {
  return InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    hintText: label,
    labelStyle: const TextStyle(color: Colors.black, fontSize: 12,fontWeight: FontWeight.w400),
    contentPadding: const EdgeInsets.only(left: 20),
    hintStyle: const TextStyle(color: Color(0xff808C9A), fontSize: 12),
    filled: true,
    fillColor: const Color(0xffE6E8EB),
    border: const OutlineInputBorder(
    ),
    enabledBorder:  OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
    ),
    focusedBorder:  OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.red, width: 1),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.red),
    ),
  );
}
