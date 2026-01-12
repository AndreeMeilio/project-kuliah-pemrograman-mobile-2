
import 'package:core/core.dart';
import 'package:products/domains/entities/product.dart';
import 'package:products/domains/entities/product_rating.dart';

class GetSingleProduct {
  final ProductRepository _repository;

  GetSingleProduct(this._repository);

  Future<GenericModelOrEntityResponse<Product>> call({
    required int id
  }) async{
    final dataFromRepository = await _repository.getSingleProduct(id: id);

    final product = Product(
      id: dataFromRepository.data.id,
      title: dataFromRepository.data.title,
      description: dataFromRepository.data.description,
      category: dataFromRepository.data.category,
      rating: ProductRating(
        rate: dataFromRepository.data.rating?.rate,
        count: dataFromRepository.data.rating?.count
      ),
      image: dataFromRepository.data.image,
      price: dataFromRepository.data.price
    );

    return GenericModelOrEntityResponse(
      status: dataFromRepository.status, 
      message: dataFromRepository.message,
      data: product
    );
  }
}