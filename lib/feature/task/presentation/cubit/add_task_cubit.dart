

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:todoapp/core/database/sqlflite_helper/sqlflite_helper.dart';
import 'package:todoapp/core/services/service_locator.dart';
import 'package:todoapp/core/utilis/app_colors.dart';
import 'package:todoapp/feature/task/data/model/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());


  DateTime currentDate = DateTime.now();
   DateTime selctedtDate = DateTime.now();
  String startTime = DateFormat("hh:mm a").format(DateTime.now());
  String endTime = DateFormat(
    "hh:mm a",
  ).format(DateTime.now().add(Duration(minutes: 45)));
  int currentIndex = 0;
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();
GlobalKey <FormState> formkey=GlobalKey<FormState>();


void getSelectDate (date){
  emit(GetDateLoading());
  selctedtDate=date;
      emit(GetDateSuccess());
  getTask();

}



void getData (context)async {
  emit(AddTaskLoadingl());
    DateTime? pickedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2026),
                            initialDate: DateTime.now(),
                          );
                       
                            if (pickedDate != null) {
                              currentDate = pickedDate;
                                emit(AddTaskSuccess());
                            } else {
                              print("======null");
                                emit(AddTaskError());
                            
                          }
}
void getStartTime(context)async{
  emit(StartTimeLoadingl());
 TimeOfDay? pickedStartTime =
                                    await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(
                                        DateTime.now(),
                                      ),
                                    );
                            
                                  if (pickedStartTime != null) {
                                    startTime = pickedStartTime.format(context);
                                          emit(StartTimeSuccess());
                                  } else {
                                    print("===null");
                                          emit(StartTimeError());
                                  }
}





void getEndTime(context)async{
  emit(EndTimeLoadingl());
     TimeOfDay? pickedEndTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                    DateTime.now(),
                                  ),
                                );
                              
                                  if (pickedEndTime != null) {
                                    endTime = pickedEndTime.format(context);
                                      emit(EndTimeSuccess());
                                  } else {
                                    print("===null");
                                      emit(EndTimeError());
                                  }
                              
}



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
void changecheck(index){
       currentIndex = index;
       emit(ChechState());
}


 List<TaskModel> tasksList =[
   
   TaskModel(id: 1, color: 1, title: "flutter", date:'8/7/2023',
   note: "learn dart", startTime: "09:33", endTime: "09:45", isCompleted: 0),


    TaskModel(id: 3, color: 1, title: "node", date:'8/9/2023',
   note: "learn backend", startTime: "09:33", endTime: "09:45", isCompleted: 1),
   ];

   void insertTask( )async{
    emit( InsertLoading());
    try{
    await  sl<SqfliteHelper>().insertToDB(
         TaskModel(id: 1, color: currentIndex,
       date:     DateFormat.yMd().format(currentDate),
        title: titleController.text, note: noteController.text, 
       startTime: startTime, endTime: endTime,
        isCompleted: 0)
      );
      
      getTask();
      //////////////////////////////*
      // await Future.delayed(Duration(seconds: 1));
      // tasksList.add(TaskModel(id: 1, color: currentIndex,
      //  date:     DateFormat.yMd().format(currentDate),
      //   title: titleController.text, note: noteController.text, 
      //  startTime: startTime, endTime: endTime,
      //   isCompleted: 0));
        titleController.clear();
        noteController.clear();

        emit( InsertSuccess());
    }catch(e){
        emit( InsertError());
    }

   }
void getTask()async{
  emit(GettasksLoading());
   await  sl<SqfliteHelper>().getFromDB().then((value){
tasksList=value.map((e)=>TaskModel.fromJson(e)).toList().where((element)=>element.date
==  DateFormat.yMd().format(selctedtDate)).toList();
  emit(GettasksSuccess());
   }).catchError((e){
    print(e.toString());
      emit(GettasksError());
   });
}
 ////////////
 void updateTask(id)async{
  emit(UpdatetasksSuccess());
   await  sl<SqfliteHelper>().updateDb(id).then((value){
  emit(UpdatetasksSuccess());
  getTask();
   }).catchError((e){
    print(e.toString());
      emit(UpdatetasksError());
   });
}
 ////////////*
 ///
 void deleteTask(id)async{
  emit(DeletetasksLoading());
   await  sl<SqfliteHelper>().deleteFromDb(id).then((value){
  emit(DeletetasksSuccess());
  getTask();
   }).catchError((e){
    print(e.toString());
      emit(DeletetasksError());
   });
}
}
