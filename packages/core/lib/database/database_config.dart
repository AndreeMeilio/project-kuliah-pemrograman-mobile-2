
import 'package:core/constant/database_tables.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConfig {

  DatabaseConfig();

  Database? _database;

  Future<Database> getDB() async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "todo.db"); 

    if (_database != null) return _database!;

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async{
        await db.execute(
          """
          create table if not exists ${AppDatabaseTables.todos} (
            id integer primary key autoincrement, 
            title varchar(20) not null,
            subtitle varchar(20) not null,
            content text not null,
            created_at datetime
          );"""
        );
      }
    );

    return _database!;
  }
}