
import 'package:core/core.dart';
import 'package:products/datas/models/product_model.dart';
import 'package:products/domains/entities/product.dart';

abstract class ProductRepository {
  Future<GenericModelOrEntityResponse<List<ProductModel>>> getAllProduct({int? limit, String? sort});
  Future<GenericModelOrEntityResponse<ProductModel>> getSingleProduct({required int id});
  Future<GenericModelOrEntityResponse<List<String>>> getAllCategory();
  Future<GenericModelOrEntityResponse<List<ProductModel>>> getProductByCategory({required String category, int? limit, String? sort});
  Future<GenericModelOrEntityResponse<ProductModel>> createNewProduct({required Product data});
  Future<GenericModelOrEntityResponse<ProductModel>> updateProduct({required Product data, required int id});
  Future<GenericModelOrEntityResponse<ProductModel>> deleteProduct({required int id});
} 
  