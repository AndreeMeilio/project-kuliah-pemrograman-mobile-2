
import 'package:carts/datas/models/cart_product_detail_model.dart';
import 'package:carts/domains/entities/cart.dart';
import 'package:carts/domains/entities/cart_product_detail.dart';
import 'package:core/core.dart';
import 'package:products/domains/entities/product_rating.dart';
import 'package:products/products.dart';

class GetSpesificCart{
  final CartRepository _repository;
  final ProductRepository _productRepository;
  
  GetSpesificCart(this._repository, this._productRepository);

  Future<GenericModelOrEntityResponse<Cart>> call({
    required int id
  }) async{
    final dataFromRepository = await _repository.getSingleCart(
      id: id,
    );

    List<CartProductDetail> detailCartProduct = [];
    print(dataFromRepository.data.detailProducts);

    if (dataFromRepository.data.detailProducts case List<CartProductDetailModel> dataDetail when dataFromRepository.data.detailProducts?.isNotEmpty ?? false){
      for (final detail in dataDetail){
        if (detail.productId case int productId when detail.productId != null){
          final GenericModelOrEntityResponse<ProductModel> product = await _productRepository.getSingleProduct(id: productId);

          detailCartProduct.add(CartProductDetail(
            productId: productId,
            quantity: detail.quantity,
            product: Product(
              id: product.data.id,
              title: product.data.title,
              category: product.data.category,
              description: product.data.description,
              image: product.data.image,
              price: product.data.price,
              rating: ProductRating(
                count: product.data.rating?.count,
                rate: product.data.rating?.rate
              ),
            )
          ));
        }
      }
    }

    final Cart dataCartResponse = Cart(
      id: dataFromRepository.data.id,
      userId: dataFromRepository.data.userId,
      date: dataFromRepository.data.date,
      v: dataFromRepository.data.v,
      detailProducts: detailCartProduct
    );

    return GenericModelOrEntityResponse(
      status: dataFromRepository.status, 
      message: dataFromRepository.message, 
      data: dataCartResponse
    );
  }
}