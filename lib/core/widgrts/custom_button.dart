import 'package:flutter/material.dart';
import 'package:todoapp/core/utilis/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text; 
final void Function()? onPressed;
 final  Color? background;
  const CustomButton({super.key, required this.text, this.onPressed,this.background=AppColors.primary});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed:onPressed, child: Text(text,style: TextStyle(color: AppColors.white)),
         style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
          backgroundColor:WidgetStateProperty.all(background)         ),
        );
  }
}