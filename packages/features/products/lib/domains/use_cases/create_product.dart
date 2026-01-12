
import 'package:core/core.dart';
import 'package:products/domains/entities/product.dart';
import 'package:products/domains/entities/product_rating.dart';

class CreateProduct {
  final ProductRepository _repository;
  final String title;
  final double price;
  final String? description;
  final String? category;
  final String? image;
  final double? rate;
  final int? count;

  CreateProduct(
    this._repository,
    {required this.title, required this.price, this.description, this.category,this.image, this.rate, this.count}
  );

  Future<GenericModelOrEntityResponse<Product>> call() async{
    final dataRequestProduct = Product(
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rating: ProductRating(
        rate: rate,
        count: count
      )
    );

    final createDataFromRepository = await _repository.createNewProduct(data: dataRequestProduct);

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