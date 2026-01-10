
import 'package:core/utils/locators.dart';
import 'package:todos/data/datasources/local/todos_local_data_source.dart';
import 'package:todos/data/repositories/todo_repository_impl.dart';
import 'package:todos/domain/repositories/todos_repository.dart';
import 'package:todos/domain/usecases/delete_todos.dart';
import 'package:todos/domain/usecases/get_todos.dart';
import 'package:todos/domain/usecases/insert_todos.dart';

class TodosInjection{
  static void setup(){
    sl.registerLazySingleton<TodosLocalDataSource>(() => TodosLocalDataSourceImpl(db: sl()));
    sl.registerLazySingleton<TodosRepository>(() => TodosRepositoryImpl(todosLocalDataSource: sl()));
    sl.registerLazySingleton(() => GetTodos(todosRepository: sl()));
    sl.registerLazySingleton(() => InsertTodos(todosRepository: sl()));
    sl.registerLazySingleton(() => DeleteTodos(todosRepository: sl()));
  }
}