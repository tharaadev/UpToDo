import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todoapp/core/database/cashe/cashe_helper.dart';
import 'package:todoapp/core/services/service_locator.dart';
import 'package:todoapp/core/utilis/app_colors.dart';
import 'package:todoapp/core/utilis/app_strings.dart';
import 'package:todoapp/core/widgrts/custom_button.dart';
import 'package:todoapp/core/widgrts/custom_text_button.dart';
import 'package:todoapp/feature/auth/data/model/on_boarding_model.dart';
import 'package:todoapp/feature/task/presentation/screens/home_screen/home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({super.key});
PageController controller=PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: PageView.builder(
          controller:  controller,
          itemCount: OnBoardingModel.onBoardingScreen.length,
          itemBuilder: (context,index){
                return Column(children: [
                      ////skip
                  index!=2? Align(
        alignment: Alignment.centerLeft,
         child:CustomTextButton(text:AppStrings.skip ,onPressed: (){
               controller.jumpToPage(2);
         },)
       
                   ):Container(height: 54,),
                   SizedBox(height: 16,),
                   //image
                   Image.asset(OnBoardingModel.onBoardingScreen[index].imagepath),
             SizedBox(height: 16,),
             //dots
             SmoothPageIndicator(    
           controller: controller,  // PageController    
           count:  3,    
           effect:  ExpandingDotsEffect(
            activeDotColor: AppColors.primary,
            dotHeight: 10,
            spacing: 8
           ),  // your preferred effect    
          
        )  ,
                   SizedBox(height: 52,),
                   //Text
                   Text(OnBoardingModel.onBoardingScreen[index].title,
                   style: Theme.of(context).textTheme.displayLarge),
             SizedBox(height: 42,),
                   //subtitle
            Text(OnBoardingModel.onBoardingScreen[index].subTitle,
            textAlign: TextAlign.center,
                   style: Theme.of(context).textTheme.displayMedium,),
             SizedBox(height: 120,),
                   //buttom
                   Row(children: [
             index!=0? CustomTextButton(text: AppStrings.back,onPressed: (){
              controller.previousPage(duration: Duration(milliseconds: 1000), curve: Curves.fastEaseInToSlowEaseOut);
             },)
        
         :Container(),
         Spacer(),
        index!=2? CustomButton(text:AppStrings.next ,onPressed: (){
   controller.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.fastEaseInToSlowEaseOut);
        },)
        :CustomButton(text:AppStrings.getStarted,onPressed:()async{
       ///navigator to screen 
   await sl<CacheHelper>().saveData(key: AppStrings.onBoardingKey, value: true).then((val){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
      });
     
         } ,)
    
         ////////////
                   ],)
                ],);
        }),
      ),
    ));
  }
}

