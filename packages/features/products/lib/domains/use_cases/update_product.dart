
import 'package:core/core.dart';
import 'package:products/domains/entities/product.dart';
import 'package:products/domains/entities/product_rating.dart';

class UpdateProduct {
  final ProductRepository _repository;
  final int id;
  final Product product;

  UpdateProduct(
    this._repository,
    {required this.id, required this.product}
  );

  Future<GenericModelOrEntityResponse<Product>> call() async{

    final createDataFromRepository = await _repository.updateProduct(
      id: id,
      data: product
    );

    final dataResponse = Product(
      id: createDataFromRepository.data.id,
      title: createDataFromRepository.data.title,
      description: createDataFromRepository.data.description,
      category: createDataFromRepository.data.category,
      rating: ProductRating(
        rate: createDataFromRepository.data.rating?.rate,
        count: createDataFromRepository.data.rating?.count
      ),
      image: createDataFromRepository.data.image,
      price: createDataFromRepository.data.price
    );

    return GenericModelOrEntityResponse(
      status: createDataFromRepository.status, 
      message: createDataFromRepository.message, 
      data: dataResponse
    );    
  }
}