
import 'package:core/constant/response_code.dart';
import 'package:core/logger/log.dart';
import 'package:todos/data/repositories/todo_repository_impl.dart';
import 'package:todos/domain/entities/todos.dart';
import 'package:todos/domain/repositories/todos_repository.dart';

class DeleteTodos {
  late TodosRepository _todosRepository;

  DeleteTodos({required TodosRepository todosRepository}): _todosRepository = todosRepository;

  Future<Todos> call({
    required TodosData todosData
  }){
    try {
      final result = _todosRepository.deleteTodos(data: todosData);

      AppLogger.info(
        message: "Menghapus Data Todos Di Use Cases",
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
          message: "Terjadi Kesalahan Ketika Menghapus Data To do",
          data: []
        )
      );
    }   
  }
}