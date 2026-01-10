
import 'package:todos/domain/entities/todos.dart';

abstract class TodosRepository{
  Future<Todos> getTodos({
    String? orderBy, 
    int? limit, 
    String? groupBy, 
    String? where, 
    List<Object?>? whereArgs
  });

  Future<Todos> insertTodos({
    required TodosData data
  });

  Future<Todos> deleteTodos({
    required TodosData data
  });
}