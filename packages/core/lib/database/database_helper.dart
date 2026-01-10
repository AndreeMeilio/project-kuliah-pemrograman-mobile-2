
import 'package:core/constant/database_tables.dart';
import 'package:core/constant/response_code.dart';
import 'package:core/database/database_config.dart';
import 'package:core/logger/log.dart';
import 'package:core/responses/database_helper_response.dart';
import 'package:core/utils/locators.dart';

class DatabaseHelper{

  Future<DatabaseHelperResponse<List<Map<String, Object?>>>> get({
    required String table,
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset

  }) async{
    try {
      final db = await sl.get<DatabaseConfig>().getDB();
      final result = await db.query(
        AppDatabaseTables.todos,
        columns: columns,
        distinct: distinct,
        groupBy: groupBy,
        having: having,
        limit: limit,
        offset: offset,
        orderBy: orderBy,
        where: where,
        whereArgs: whereArgs
      );

      AppLogger.info(
        message: "Result Get Data",
        data: result
      );

      return DatabaseHelperResponse<List<Map<String, Object?>>>(
        status: ResponseCodeEnum.success,
        message: "Berhasil mendapatkan data",
        data: result
      );

    } catch (e){
      AppLogger.error(
        error: e.toString()
      );
      return DatabaseHelperResponse<List<Map<String, Object?>>>(
        status: ResponseCodeEnum.error,
        message: "Gagal mendapatkan data",
        data: []
      );
    }
  }

  Future<DatabaseHelperResponse<List<Map<String, Object?>>>> insert({
    required String tableName, 
    required Map<String, Object?> data
  }) async{
    try {
      final db = await sl.get<DatabaseConfig>().getDB();
      final result = await db.insert(tableName, data);

      AppLogger.info(
        message: "Insert Data Ke Local Database",
        data: {
          "result": result,
          "data": data
        }
      );

      late ResponseCodeEnum status;
      late String message;

      if (result != 0){
        status = ResponseCodeEnum.success;
        message = "Berhasil Menambah Data";
      } else {
        status = ResponseCodeEnum.error;
        message = "Gagal Menambah Data";
      }

      return DatabaseHelperResponse<List<Map<String, Object?>>>(
        status: status,
        message: message,
        data: [data]
      );
    } catch (e){
      AppLogger.error(
        error: e.toString()
      );
      return DatabaseHelperResponse<List<Map<String, Object?>>>(
        status: ResponseCodeEnum.error,
        message: "Gagal mendapatkan data",
        data: null
      );
    }
  }

  Future<DatabaseHelperResponse<List<Map<String, Object?>>>> delete({
    required String table,
    String? where,
    List<Object?>? whereArgs
  }) async{
    try {
      final db = await sl.get<DatabaseConfig>().getDB();

      final resultData = await db.query(
        table,
        where: where,
        whereArgs: whereArgs
      );

      AppLogger.info(
        message: "Check Data Before Deleting",
        data: resultData.toString()
      );

      if (resultData.isNotEmpty){
        final result = await db.delete(table, where: where, whereArgs: whereArgs);

        if (result != 0){
          AppLogger.info(
            message: "Berhasil Menghapus Data",
            data: {
              "status": result,
              "data": resultData
            }
          );

          return DatabaseHelperResponse<List<Map<String, Object?>>>(
            status: ResponseCodeEnum.success,
            message: "Berhasil Menghapus Data",
            data: resultData
          );
        } else {
          AppLogger.info(
            message: "Gagal Menghapus Data",
            data: {
              "status": result,
              "data": resultData
            }
          );

          return DatabaseHelperResponse<List<Map<String, Object?>>>(
            status: ResponseCodeEnum.error,
            message: "Gagal Menghapus Data",
            data: []
          );
        }
      } else {
        AppLogger.info(
          message: "Data Tidak Ada Pada Database",
          data: {
            "status": 0,
            "data": resultData
          }
        );

        return DatabaseHelperResponse<List<Map<String, Object?>>>(
          status: ResponseCodeEnum.success,
          message: "Data Tidak Ditemukan",
          data: []
        );
      }
    } catch (e){
      AppLogger.error(
        error: e.toString()
      );
      return DatabaseHelperResponse<List<Map<String, Object?>>>(
        status: ResponseCodeEnum.error,
        message: "Gagal menghapus data",
        data: null
      );
    }
  }
}