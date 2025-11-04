import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/core/commons/commons.dart';
import 'package:todoapp/core/utilis/app_colors.dart';
import 'package:todoapp/core/utilis/app_strings.dart';
import 'package:todoapp/core/widgrts/custom_button.dart';
import 'package:todoapp/feature/task/presentation/component/add_task_component.dart';
import 'package:todoapp/feature/task/presentation/cubit/add_task_cubit.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined,color: AppColors.white,),
        ),
        centerTitle: false,
        title: Text(
          AppStrings.addTask,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(24),
          child: BlocListener<AddTaskCubit, AddTaskState>(
            listener: (context, state) {
              if(state is InsertSuccess){
    ////////////////!
    showToast(message: "added Successfuly",state:ToastStates.success );
              
             Navigator.of(context).pop();
              }
            },
            child: BlocBuilder<AddTaskCubit, AddTaskState>(
              builder: (context, state) {
                return Form(
                  key: BlocProvider.of<AddTaskCubit>(context).formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AddTaskComponent(
                          validator: (val){
                                if(val!.isEmpty){
                                  return " Enter valid Title";
                                }
                                return null;
                              },
                        text: AppStrings.title,
                        controller: BlocProvider.of<AddTaskCubit>(
                          context,
                        ).titleController,
                        hintText: AppStrings.titleHint,
                      ),

                      ////////////////////////////////*
                      SizedBox(height: 15),
                      AddTaskComponent(
                          validator: (val){
                                if(val!.isEmpty){
                                  return " Enter valid note";
                                }
                                return null;
                              },
                        text: AppStrings.note,
                        controller: BlocProvider.of<AddTaskCubit>(
                          context,
                        ).noteController,
                        hintText: AppStrings.noteHint,
                      ),
                      ///////////
                      SizedBox(height: 15),
                      //! dateStart
                      AddTaskComponent(
                        readonly: true,
                        text: AppStrings.date,
                        suffixIcon: IconButton(
                          onPressed: () async {
                            ////////////
                            BlocProvider.of<AddTaskCubit>(
                              context,
                            ).getData(context);
                          },
                          icon: Icon(
                            Icons.calendar_month_rounded,
                            color: AppColors.white,
                          ),
                        ),
                        hintText: DateFormat.yMd().format(
                          BlocProvider.of<AddTaskCubit>(context).currentDate,
                        ),
                      ),
                      //!dateEnd
                      SizedBox(height: 15),
                      Row(
                        children: [
                          ////////*
                          Expanded(
                            child: AddTaskComponent(
                              text: AppStrings.startTime,
                              hintText: BlocProvider.of<AddTaskCubit>(
                                context,
                              ).startTime,
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  ////////////////!
                                  BlocProvider.of<AddTaskCubit>(
                                    context,
                                  ).getStartTime(context);
                                },
                                icon: Icon(
                                  Icons.timer_outlined,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          //////////////////////*
                          SizedBox(width: 26),
                          Expanded(
                            child: AddTaskComponent(
                            
                              text: AppStrings.endTime,
                              hintText: BlocProvider.of<AddTaskCubit>(
                                context,
                              ).endTime,
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  //////////////////////!
                                  BlocProvider.of<AddTaskCubit>(
                                    context,
                                  ).getEndTime(context);
                                },
                                icon: Icon(
                                  Icons.timer_outlined,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //!
                      SizedBox(height: 15),
                      SizedBox(
                        height: 68,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              AppStrings.color,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            SizedBox(height: 5.h,),
                            Expanded(
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: 8),
                                itemBuilder: (context, index) {
                                  //////////////////!
                                  return GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<AddTaskCubit>(
                                        context,
                                      ).changecheck(index);
                                    },
                                    child: CircleAvatar(
                                      
                                      backgroundColor:
                                          BlocProvider.of<AddTaskCubit>(
                                            context,
                                          ).getColor(index),
                                      child:
                                          index ==
                                              BlocProvider.of<AddTaskCubit>(
                                                context,
                                              ).currentIndex
                                          ? Icon(Icons.check)
                                          : null,
                                    ),
                                  );
                                },
                                itemCount: 6,
                              ),
                            ),

                           
                          ],
                        ),
                      ),
                      //*
                      SizedBox(height: 80),
                      state is InsertLoading
                          ? Center(child: CircularProgressIndicator())
                          : SizedBox(
                              height: 40,
                              width: double.infinity,
                              child: CustomButton(
                                text: AppStrings.createTask,
                                onPressed: () {
                                  if(
                                      BlocProvider.of<AddTaskCubit>(context).formkey.currentState!.validate()
                                  ){
                       BlocProvider.of<AddTaskCubit>(context).insertTask();
                    
                                  }
                        
                                },
                              ),
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
