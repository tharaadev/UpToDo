import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/database/cashe/cashe_helper.dart';
import 'package:todoapp/core/services/service_locator.dart';
import 'package:todoapp/core/utilis/app_assets.dart';
import 'package:todoapp/core/utilis/app_strings.dart';
import 'package:todoapp/feature/auth/presentation/screen/on_boarding_screen/on_boarding_screen.dart';
import 'package:todoapp/feature/task/presentation/screens/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
   navigate();
    super.initState();
  }
void navigate(){
  bool isVisited =sl<CacheHelper>().getData(key: AppStrings.onBoardingKey)??false;
  Future.delayed(Duration(seconds: 3),(){
Navigator.push(context, MaterialPageRoute(builder: (_)=> isVisited?  HomeScreen():  OnBoardingScreen()));
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        body:Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(AppAssets.logo),
          SizedBox(height: 20,),
          Text(AppStrings.appName,style:  Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 35.sp))
        ],))
    );
  }
}