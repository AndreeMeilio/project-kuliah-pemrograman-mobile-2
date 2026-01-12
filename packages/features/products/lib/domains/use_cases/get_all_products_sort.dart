
import 'package:core/core.dart';
import 'package:products/domains/entities/product.dart';
import 'package:products/domains/entities/product_rating.dart';

class GetAllProductsSort {
  final ProductRepository _repository;

  GetAllProductsSort(this._repository);

  Future<GenericModelOrEntityResponse<List<Product>>> call({
    int? limit,
    String? sort
  }) async{
    final dataFromRepository = await _repository.getAllProduct(
      limit: limit,
      sort: sort
    );

    final List<Product> dataList = dataFromRepository.data.map((productModel){
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

    return GenericModelOrEntityResponse<List<Product>>(
      status: dataFromRepository.status,
      message: dataFromRepository.message,
      data: dataList
    );
  }
}