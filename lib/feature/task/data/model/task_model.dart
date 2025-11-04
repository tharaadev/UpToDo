class  TaskModel{
  final int? id;
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  final int isCompleted;
  final int color;
  final String date;

  TaskModel( {this.id, required this.color, required this.date,
  required this.title, required this.note, required this.startTime,
   required this.endTime, required this.isCompleted});

   factory TaskModel.fromJson(Map<String,dynamic>jsonData){
    return TaskModel(
      id:jsonData['id'] ??'',
      color: jsonData['color']??'',
    date: jsonData['date']??'', title: jsonData['title']??'', note: jsonData['note']??'',
     startTime: jsonData['startTime']??'', endTime: jsonData['endTime']??'', isCompleted: jsonData['isCompleted']??0);
   }
}