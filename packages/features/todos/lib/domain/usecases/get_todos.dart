
import 'package:core/constant/response_code.dart';
import 'package:core/logger/log.dart';
import 'package:todos/data/repositories/todo_repository_impl.dart';
import 'package:todos/domain/entities/todos.dart';
import 'package:todos/domain/repositories/todos_repository.dart';

class GetTodos{
  final TodosRepository _todosRepository;

  GetTodos({
    required TodosRepository todosRepository
  }) : _todosRepository = todosRepository;

  Future<Todos> call({
    String? orderBy, 
    int? limit, 
    String? groupBy, 
    String? where, 
    List<Object?>? whereArgs
  }){
    try {
      final result = _todosRepository.getTodos(
        groupBy: groupBy,
        limit: limit,
        orderBy: orderBy,
        where: where,
        whereArgs: whereArgs
      );

      AppLogger.info(
        message: "Get Data From Use Case",
        data: result.toString()
      );

      return result;
    } catch (e){
      AppLogger.error(
        error: e.toString()
      );

      return Future.value(
        Todos(
          status: ResponseCodeEnum.error,
          message: "Terjadi Kesalahan Ketika Memuat Data To do",
          data: []
        )
      );
    }
  }
}