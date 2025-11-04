import 'package:flutter/material.dart';
import 'package:todoapp/core/utilis/app_colors.dart';


class AddTaskComponent extends StatelessWidget {
  const AddTaskComponent({super.key, required this.text,  this.controller, 
  required this.hintText, this.suffixIcon, this.readonly=false, this.validator});
final String text;
final TextEditingController? controller;
final String hintText;
final IconButton?  suffixIcon;
final bool readonly;
final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       SizedBox(height: 24,),
           Text(text,style: Theme.of(context).textTheme.displayMedium ,),
           SizedBox(height: 8,),
    TextFormField(
        style: TextStyle(color: Colors.white),
      validator:validator ,
      readOnly: readonly,
      controller:controller,
      decoration: InputDecoration(
        suffixIcon:  suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8)
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.displayMedium,
        fillColor: AppColors.lightblack,filled: true,
      ),
    ),
    ],);
  }
}