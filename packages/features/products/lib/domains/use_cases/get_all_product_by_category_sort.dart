
import 'package:core/core.dart';
import 'package:products/domains/entities/product.dart';
import 'package:products/domains/entities/product_rating.dart';

class GetAllProductByCategorySort {
  final ProductRepository _repository;
  final String category;
  final int limit;
  final String sort;

  GetAllProductByCategorySort(this._repository, {
    required this.category,
    required this.limit, 
    required this.sort
  });

  Future<GenericModelOrEntityResponse<List<Product>>> call() async{
    final dataFromRepository = await _repository.getProductByCategory(
      category: category,
      limit: limit,
      sort: sort
    );

    final List<Product> dataProduct = dataFromRepository.data.map((productModel){
      return Product(
        id: productModel.id,
        title: productModel.title,
        description: productModel.description,
        image: productModel.image,
        category: productModel.category,
        price: productModel.price,
        rating: ProductRating(
          count: productModel.rating?.count,
          rate: productModel.rating?.rate
        )
      );
    }).toList();

    return GenericModelOrEntityResponse<List<Product>>(
      status: dataFromRepository.status, 
      message: dataFromRepository.message, 
      data: dataProduct
    );
  }
}