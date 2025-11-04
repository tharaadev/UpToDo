import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/theme/theme.dart';
import 'package:todoapp/core/utilis/app_strings.dart';
import 'package:todoapp/feature/auth/presentation/screen/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (context , child){
         return MaterialApp(
        theme: getAppTheme(),
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        home:SplashScreen()
        
     
      );});
    
  }
}