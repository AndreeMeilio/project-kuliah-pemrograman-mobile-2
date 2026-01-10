import 'package:core/constant/response_code.dart';

class Todos {
  ResponseCodeEnum? status;
  String? message;
  List<TodosData>? data;

  Todos({
      this.status,
      this.message,
      this.data,
  });
}

class TodosData {
  int? id;
  String? title;
  String? subTitle;
  String? content;
  DateTime? createAt;

  TodosData({
      this.id,
      this.title,
      this.subTitle,
      this.content,
      this.createAt,
  });

  Map<String, Object?> toMap(){
    return {
      "title": title,
      "subtitle": subTitle,
      "content": content,
      "created_at": createAt.toString()
    };
  }
}

