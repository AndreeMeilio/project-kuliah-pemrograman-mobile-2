
import 'package:core/constant/response_code.dart';
import 'package:core/logger/log.dart';
import 'package:todos/data/datasources/local/todos_local_data_source.dart';
import 'package:todos/data/models/todos_model.dart';
import 'package:todos/domain/entities/todos.dart';
import 'package:todos/domain/repositories/todos_repository.dart';

class TodosRepositoryImpl extends TodosRepository{

  final TodosLocalDataSource _todosLocalDataSource;

  TodosRepositoryImpl({
    required TodosLocalDataSource todosLocalDataSource
  }) : _todosLocalDataSource = todosLocalDataSource;

  @override
  Future<Todos> getTodos({String? orderBy, int? limit, String? groupBy, String? where, List<Object?>? whereArgs}) async{
    try {
      final result = await _todosLocalDataSource.getData(
        groupBy: groupBy,
        limit: limit,
        orderBy: orderBy,
        where: where,
        whereArgs: whereArgs
      );

      AppLogger.info(
        message: "Get Data From Repository",
        data: result.data.toString()
      );

      return result.toEntity();
    } catch (e){
      AppLogger.error(
        error: e.toString()
      );

      return TodosModel(
        status: ResponseCodeEnum.error,
        message: "Terjadi Kesalahan Ketika Memuat Data Todo",
        data: []
      ).toEntity();
    }
  }
  
  @override
  Future<Todos> insertTodos({required TodosData data}) async{
    try {
      final result = await _todosLocalDataSource.insertData(data: data);

      AppLogger.info(
        message: "Insert Data From Repository",
        data: result.toString()
      );

      return result.toEntity();
    } catch (e){
      AppLogger.error(
        error: e.toString()
      );
      
      return TodosModel(
        status: ResponseCodeEnum.error,
        message: "Terjadi Kesalahan Ketika Membuat Data To do",
        data: []
      ).toEntity();
    }
  }
  
  @override
  Future<Todos> deleteTodos({required TodosData data}) async{
    try {

      final result = await _todosLocalDataSource.deleteData(data: data);

      AppLogger.info(
        message: "Delete Data From Repository",
        data: result.toString()
      );

      return result.toEntity();

    } catch (e){
      AppLogger.error(
        error: e.toString()
      );
      
      return TodosModel(
        status: ResponseCodeEnum.error,
        message: "Terjadi Kesalahan Ketika Membuat Data To do",
        data: []
      ).toEntity();
    }
  }
}