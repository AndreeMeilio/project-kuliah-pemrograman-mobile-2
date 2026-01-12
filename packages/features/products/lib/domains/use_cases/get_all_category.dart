
import 'package:core/core.dart';

class GetAllCategory {
  final ProductRepository _repository;

  GetAllCategory(this._repository);

  Future<GenericModelOrEntityResponse<List<String>>> call() async{
    final dataFromRepository = await _repository.getAllCategory();

    return dataFromRepository;
  }
}