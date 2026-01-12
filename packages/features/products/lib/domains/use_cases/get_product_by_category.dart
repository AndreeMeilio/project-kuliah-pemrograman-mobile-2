
import 'package:core/core.dart';
import 'package:products/domains/entities/product.dart';
import 'package:products/domains/entities/product_rating.dart';

class GetProductByCategory {
  final ProductRepository _repository;
  final String category;

  GetProductByCategory(this._repository, {required this.category});

  Future<GenericModelOrEntityResponse<List<Product>>> call() async{
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