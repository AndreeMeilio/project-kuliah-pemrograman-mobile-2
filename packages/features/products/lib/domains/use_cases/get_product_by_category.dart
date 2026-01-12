
import 'package:core/core.dart';
import 'package:products/domains/entities/product.dart';
import 'package:products/domains/entities/product_rating.dart';

class GetProductByCategory {
  final ProductRepository _repository;

  GetProductByCategory(this._repository);

  Future<GenericModelOrEntityResponse<List<Product>>> call({
    required String category
  }) async{
    final dataFromRepository = await _repository.getProductByCategory(
      category: category
    );

    final List<Product> dataList = dataFromRepository.data.map((productModel) {
      return Product(
        id: productModel.id,
        title: productModel.title,
        description: productModel.description,
        category: productModel.category,
        rating: ProductRating(
          rate: productModel.rating?.rate,
          count: productModel.rating?.count
        ),
        image: productModel.image,
        price: productModel.price
      );
    }).toList();

    return GenericModelOrEntityResponse(
      status: dataFromRepository.status, 
      message: dataFromRepository.message, 
      data: dataList
    );
  }
}