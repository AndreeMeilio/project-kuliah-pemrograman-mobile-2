import 'package:core/constant/database_tables.dart';
import 'package:core/constant/response_code.dart';
import 'package:core/database/database_helper.dart';
import 'package:core/logger/log.dart';
import 'package:core/utils/locators.dart';
import 'package:todos/data/models/todos_model.dart';
import 'package:todos/domain/entities/todos.dart';

abstract class TodosLocalDataSource {
  Future<TodosModel> getData({
    String? orderBy,
    int? limit,
    String? groupBy,
    String? where,
    List<Object?>? whereArgs,
  });
  
  Future<TodosModel> insertData({
    required TodosData data
  });

  Future<TodosModel> deleteData({
    required TodosData data
  });
}

class TodosLocalDataSourceImpl extends TodosLocalDataSource{

  final DatabaseHelper _db;
  
  TodosLocalDataSourceImpl({
    required DatabaseHelper db
  }) : _db = db;

  @override
  Future<TodosModel> getData({
    String? orderBy, 
    int? limit, 
    String? groupBy, 
    String? where, 
    List<Object?>? whereArgs
  }) async{
    try {
      final result = await _db.get(
        table: AppDatabaseTables.todos,
        groupBy: groupBy,
        limit: limit,
        where: where,
        whereArgs: whereArgs
      );

      AppLogger.info(
        message: "Get Data Todos Level Local Data Source",
        data: result.toString()
      );

      return TodosModel.fromMap(
        result.toJson()
      );
    } catch (e){
      AppLogger.error(
        error: e.toString()
      );

      return TodosModel(
        status: ResponseCodeEnum.error,
        message: "Terjadi Kesahalan Dalam Memuat Data",
        data: []
      );
    }
  }
  
  @override
  Future<TodosModel> insertData({required TodosData data}) async{
    try {
      final result = await _db.insert(
        tableName: AppDatabaseTables.todos,
        data: data.toMap()
      );
      
      AppLogger.info(
        message: "Insert Data From Local Data Source",
        data: result.data.toString()
      );

      return TodosModel.fromMap(result.toJson());
    } catch (e){
      AppLogger.error(
        error: e.toString()
      );

      return TodosModel(
        status: ResponseCodeEnum.error,
        message: "Terjadi Kesalahan Ketika Membuat Data Todo",
        data: []
      );
    }
  }
  
  @override
  Future<TodosModel> deleteData({required TodosData data}) async{
    try {
      final result = await _db.delete(
        table: AppDatabaseTables.todos,
        where: "id = ?",
        whereArgs: [
          data.id
        ]
      );

      AppLogger.info(
        message: "Delete Data From Local Data Source",
        data: result.data.toString()
      );

      return TodosModel.fromMap(
        result.toJson()
      );
    } catch (e){
      AppLogger.error(
        error: e.toString()
      );

      return TodosModel(
        status: ResponseCodeEnum.error,
        message: "Terjadi Kesalahan Ketika Membuat Data Todo",
        data: []
      );
    }
  }
}