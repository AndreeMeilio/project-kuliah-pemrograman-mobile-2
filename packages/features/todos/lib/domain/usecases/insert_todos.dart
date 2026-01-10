
import 'package:core/constant/response_code.dart';
import 'package:core/logger/log.dart';
import 'package:todos/domain/entities/todos.dart';
import 'package:todos/domain/repositories/todos_repository.dart';

class InsertTodos{

  final TodosRepository _todosRepository;

  InsertTodos({
    required TodosRepository todosRepository
  }) : _todosRepository = todosRepository;

  Future<Todos> call({
    required TodosData data
  }){
    try {
      final result = _todosRepository.insertTodos(data: data);

      AppLogger.info(
        message: "Insert Data From Use Case",
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
          message: "Terjadi Kesalahan Ketika Membuat Data To do",
          data: []
        )
      );
    }
  }
}