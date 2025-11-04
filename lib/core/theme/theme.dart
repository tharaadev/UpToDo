import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/core/utilis/app_colors.dart';

ThemeData getAppTheme(){
  return ThemeData(
    primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        ////appBarTheme
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.background
        ),

        /////textTheme
        textTheme: TextTheme(
          
          displayLarge:  GoogleFonts.lato(
        color: AppColors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold
                   ),
                   displayMedium: GoogleFonts.lato(
        color: AppColors.white,
        fontSize: 16,
                   
                   ),
                   displaySmall: GoogleFonts.lato(
           
           color: AppColors.white.withOpacity(0.44)
           ,
           fontSize: 16)
        ),



        /////buttom theme
        elevatedButtonTheme: ElevatedButtonThemeData(
           style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary,
         
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8)
         )),
        )
      );
}