import 'package:core/constant/response_code.dart';
import 'package:todos/domain/entities/todos.dart';

class TodosModel {
    ResponseCodeEnum? status;
    String? message;
    List<TodosModelData>? data;

    TodosModel({
        this.status,
        this.message,
        this.data,
    });

    factory TodosModel.fromMap(Map<String, Object?> data){
      return TodosModel(
        status: data["status"] as ResponseCodeEnum,
        message: data["message"] as String?,
        data: (data["data"] as List?)?.isNotEmpty ?? false
          ? List<TodosModelData>.from(
              (data["data"] as List).map(
                (todos) => TodosModelData.fromJson(
                  todos
                )
              )
            )
          : []
      );
    }

    Todos toEntity(){
      return Todos(
        status: status,
        message: message,
        data: data?.isNotEmpty ?? false
          ? List<TodosData>.from(
              data!.map((modelData) => modelData.toEntity(modelData))
            )
          : []
      );
    }
}

class TodosModelData {
    int? id;
    String? title;
    String? subTitle;
    String? content;
    DateTime? createAt;

    TodosModelData({
        this.id,
        this.title,
        this.subTitle,
        this.content,
        this.createAt,
    });

    factory TodosModelData.fromJson(Map<String, Object?> data){
      return TodosModelData(
        id: int.parse((data["id"] ?? 0).toString()),
        title: data["title"] as String?,
        content: data["content"] as String?,
        subTitle: data["subtitle"]as String?,
        createAt: DateTime.parse(data["created_at"] as String)
      ); 
    }

    TodosData toEntity(TodosModelData modelData){
      return TodosData(
        id: modelData.id ?? 0,
        title: modelData.title ?? "",
        subTitle: modelData.subTitle ?? "",
        content: modelData.content ?? "",
        createAt: modelData.createAt
      );
    }
}

