
import 'package:core/constant/response_code.dart';

class GenericModelOrEntityResponse<T> {
  late ResponseCodeEnum status;
  late String message;
  late T data;

  GenericModelOrEntityResponse({
    required this.status,
    required this.message,
    required this.data
  });
}