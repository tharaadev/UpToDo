import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/core/utilis/app_assets.dart';
import 'package:todoapp/core/utilis/app_colors.dart';
import 'package:todoapp/core/utilis/app_strings.dart';
import 'package:todoapp/core/widgrts/custom_button.dart';
import 'package:todoapp/feature/task/data/model/task_model.dart';
import 'package:todoapp/feature/task/presentation/cubit/add_task_cubit.dart';
import 'package:todoapp/feature/task/presentation/screens/add_task_screen/add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocBuilder<AddTaskCubit, AddTaskState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            
                children: [
                  Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 12),
                  Text(
                    AppStrings.today,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 20.h,),
                  //
                  DatePicker(
                    height: 90.h,
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: AppColors.primary,
                    selectedTextColor: AppColors.white,
                    dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                    dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                    monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                    onDateChange: (date) {
                           BlocProvider.of<AddTaskCubit>(context).getSelectDate(date);
                    // New date selected
                    //   setState(() {
                    //     _selectedValue = date;
                    //   });
                    },
                  ),
                  SizedBox(height: 50),
                  BlocProvider.of<AddTaskCubit>(context).tasksList.isEmpty
                      ? noTasksWidget(context)
                      :
                        // ,
                        Expanded(
                          child: ListView.builder(
                            itemCount: BlocProvider.of<AddTaskCubit>(context).tasksList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        padding: EdgeInsets.all(24),
                                        height: 240,
                                        color: AppColors.deepGrey,
                                        child: Column(
                                          children: [
                                                BlocProvider.of<AddTaskCubit>(context).tasksList[index].isCompleted==1?
                                                Container():
                                            SizedBox(
                                              height: 40,
                                              width: double.infinity,
                                              child: CustomButton(
                                                text: AppStrings.taskCompleted,
                                                onPressed: () {
                           BlocProvider.of<AddTaskCubit>(context).updateTask(
                             BlocProvider.of<AddTaskCubit>(context).tasksList[index].id
                           )    ;    
                           Navigator.pop(context)   ;         
                                                },
                                              ),
                                            ),
                                            SizedBox(height: 24),

                                            ///
                                            SizedBox(
                                              height: 40,
                                              width: double.infinity,
                                              child: CustomButton(
                                                text: AppStrings.deleteTask,
                                                onPressed: () {

                BlocProvider.of<AddTaskCubit>(context).deleteTask(
                             BlocProvider.of<AddTaskCubit>(context).tasksList[index].id
                           )    ;    
                           Navigator.pop(context)   ;                                      
                                                },
                                                background: AppColors.red,
                                              ),
                                            ),
                                            SizedBox(height: 24),
                                            //
                                            SizedBox(
                                              height: 40,
                                              width: double.infinity,
                                              child: CustomButton(
                                                text: AppStrings.cancle,
                                                onPressed: () {   Navigator.of(context).pop();},
                                              ),
                                            ),
                                            SizedBox(height: 24),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: TaskComponent(
                                  taskModel: BlocProvider.of<AddTaskCubit>(context).tasksList[index],
                                ),
                              );
                            },
                          ),
                        ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddTaskScreen()),
            );
          },
          backgroundColor: AppColors.primary,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class TaskComponent extends StatelessWidget {
  final TaskModel taskModel;
  const TaskComponent({super.key, required this.taskModel});
  Color getColor(index) {
    switch (index) {
      case 0:
        return AppColors.red;
      case 1:
        return AppColors.green;
      case 2:
        return AppColors.blurGrey;
      case 3:
        return AppColors.blue;
      case 4:
        return AppColors.orange;
      case 5:
        return AppColors.pruple;
      default:
        return AppColors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(8),
      height: 132,
      decoration: BoxDecoration(
        color: getColor(taskModel.color),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //text
                Text(
                  taskModel.title,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
               SizedBox(height: 16,),
                SizedBox(width: 7),
                //row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.timer, color: AppColors.white),
                    SizedBox(width: 5),
                    Text(
                      '${taskModel.startTime}  -${taskModel.endTime} ',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                SizedBox(width: 7),
                //text
                // SizedBox(height: 5,),
                  // Container(
                  //   padding: EdgeInsets.all(5),
                  //   child: Text(
                  //   taskModel.note,
                  //   style: Theme.of(context).textTheme.displayLarge,
                  //                   ),
                  // ),
               
              ],
            ),
          ),
            
          //Divider
          Container(height: 75, width: 1, color: AppColors.white),

          SizedBox(width: 10),

          //Text
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              taskModel.isCompleted ==1? AppStrings.completed : AppStrings.toDo,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}

Column noTasksWidget(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
       margin: EdgeInsets.only(left: 62),
        child: Image.asset(AppAssets.noTasks)),
      Text(
        AppStrings.noTaskTitle,
        style: Theme.of(
          context,
        ).textTheme.displayMedium!.copyWith(fontSize: 24),
      ),
      Text(
        AppStrings.noTaskSubTitle,
        style: Theme.of(context).textTheme.displayMedium!,
      ),
    ],
  );
}
