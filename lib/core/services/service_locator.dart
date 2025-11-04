import 'package:get_it/get_it.dart';
import 'package:todoapp/core/database/cashe/cashe_helper.dart';
import 'package:todoapp/core/database/sqlflite_helper/sqlflite_helper.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton<CacheHelper>(()=> CacheHelper());
 sl.registerLazySingleton<SqfliteHelper>(()=> SqfliteHelper());

}