import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/app/app.dart';
import 'package:todoapp/core/database/cashe/cashe_helper.dart';
import 'package:todoapp/core/database/sqlflite_helper/sqlflite_helper.dart';
import 'package:todoapp/core/services/service_locator.dart';
import 'package:todoapp/feature/task/presentation/cubit/add_task_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await sl<CacheHelper>().init();
   sl<SqfliteHelper>().initDB();
  runApp(
    BlocProvider(create: (context) =>AddTaskCubit().. getTask(), child: const MyApp()),
  );
}
