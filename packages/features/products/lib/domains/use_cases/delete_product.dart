
import 'package:core/core.dart';
import 'package:core/domain/product_repository.dart';
import 'package:products/domains/entities/product.dart';
import 'package:products/domains/entities/product_rating.dart';

class DeleteProduct {
  final ProductRepository _repository;
  final int id;

  DeleteProduct(this._repository, {required this.id});

  Future<GenericModelOrEntityResponse<Product>> call() async{
    final deleteDataFromRepository = await _repository.deleteProduct(id: id);

    final dataDelete = Product(
      id: deleteDataFromRepository.data.id,
      title: deleteDataFromRepository.data.title,
      description: deleteDataFromRepository.data.description,
      image: deleteDataFromRepository.data.image,
      category: deleteDataFromRepository.data.category,
      price: deleteDataFromRepository.data.price,
      rating: ProductRating(
        count: deleteDataFromRepository.data.rating?.count,
        rate: deleteDataFromRepository.data.rating?.rate
      )
    );

    return GenericModelOrEntityResponse(
      status: deleteDataFromRepository.status, 
      message: deleteDataFromRepository.message, 
      data: dataDelete
    );
  }
}