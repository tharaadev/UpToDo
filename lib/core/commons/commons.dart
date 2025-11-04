  import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/core/utilis/app_colors.dart';
void showToast ({required String message, required ToastStates state}){
              Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: getState(state),
        textColor: Colors.white,
        fontSize: 16.0
    );
   }

   enum ToastStates{error,success,warining}
   Color getState(ToastStates  state){
    switch(state){
      case ToastStates.error : return  AppColors.red;
      case ToastStates.success:
       return  AppColors.primary;
      case ToastStates.warining:
           return  AppColors.orange;
    }
   }