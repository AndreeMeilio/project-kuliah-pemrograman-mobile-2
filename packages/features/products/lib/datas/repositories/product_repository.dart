import 'dart:convert';

import 'package:core/constant/response_code.dart';
import 'package:core/domain/product_repository.dart';
import 'package:core/utils/generic_model_or_entity_response.dart';
import 'package:products/datas/data_sources/remote_data_source.dart';
import 'package:products/datas/models/product_model.dart';
import 'package:products/datas/models/product_rating_model.dart';
import 'package:products/domains/entities/product.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource _remoteDataSource;

  ProductRepositoryImpl(this._remoteDataSource);

  @override
  Future<GenericModelOrEntityResponse<ProductModel>> createNewProduct({required Product data}) async{
    final dataSource = await _remoteDataSource.createNewProduct(data: ProductModel(
        title: data.title,
        price: data.price,
        description: data.description,
        category: data.category,
        image: data.image,
        rating: ProductRatingModel(
          rate: data.rating?.rate,
          count: data.rating?.count
        )
      )
    );

    late ProductModel dataFinal;
    if (dataSource.response?.data case Map<String, dynamic> dataResponse when dataSource.status == ResponseCodeEnum.success){
      dataFinal = ProductModel.fromJson(dataResponse);
    } else {
      dataFinal = ProductModel.empty();
    }

    return GenericModelOrEntityResponse<ProductModel>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: dataFinal
    );
  }

  @override
  Future<GenericModelOrEntityResponse<ProductModel>> deleteProduct({required int id}) async{
    final dataSource = await _remoteDataSource.deleteProduct(id: id);

    late ProductModel dataFinal;
    if (dataSource.response?.data case Map<String, dynamic> dataResponse when dataSource.status == ResponseCodeEnum.success){
      dataFinal = ProductModel.fromJson(dataResponse);
    } else {
      dataFinal = ProductModel.empty();
    }

    return GenericModelOrEntityResponse<ProductModel>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: dataFinal
    );
  }

  @override
  Future<GenericModelOrEntityResponse<List<String>>> getAllCategory() async{
    final dataSource = await _remoteDataSource.getAllCategory();

    List<String> data = [];
    if (dataSource.response?.data case List dataResponse when dataSource.status == ResponseCodeEnum.success){
      data = List.from(dataResponse);
    }

    return GenericModelOrEntityResponse<List<String>>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: data
    );
  }

  @override
  Future<GenericModelOrEntityResponse<List<ProductModel>>> getAllProduct({int? limit, String? sort}) async{
    final dataSource = await _remoteDataSource.getAllProduct(
      limit: limit,
      sort: sort
    );

    List<ProductModel> dataProduct = [];
    
    if (dataSource.response?.data case List dataResponse! when dataSource.status == ResponseCodeEnum.success){
      dataProduct = productModelFromJson(jsonEncode(dataResponse));
    }

    return GenericModelOrEntityResponse<List<ProductModel>>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: dataProduct
    );
  }

  @override
  Future<GenericModelOrEntityResponse<List<ProductModel>>> getProductByCategory({required String category, int? limit, String? sort}) async{
    final dataSource = await _remoteDataSource.getAllProduct(
      limit: limit,
      sort: sort
    );

    List<ProductModel> dataProduct = [];
    
    if (dataSource.response?.data case List dataResponse! when dataSource.status == ResponseCodeEnum.success){
      dataProduct = productModelFromJson(jsonEncode(dataResponse));
    }

    return GenericModelOrEntityResponse<List<ProductModel>>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: dataProduct
    );
  }

  @override
  Future<GenericModelOrEntityResponse<ProductModel>> getSingleProduct({required int id}) async{
    final dataSource = await _remoteDataSource.getSingleProduct(id: id);

    late ProductModel data;

    if (dataSource.response?.data case Map<String, dynamic> dataResponse when dataSource.status == ResponseCodeEnum.success){
      data = ProductModel.fromJson(dataResponse);
    } else {
      data = ProductModel.empty();
    }

    return GenericModelOrEntityResponse<ProductModel>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: data
    );
  }

  @override
  Future<GenericModelOrEntityResponse<ProductModel>> updateProduct({required Product data, required int id}) async{
    final dataSource = await _remoteDataSource.updateProduct(
      data: ProductModel(
        title: data.title,
        price: data.price,
        description: data.description,
        category: data.category,
        image: data.image,
        rating: ProductRatingModel(
          rate: data.rating?.rate,
          count: data.rating?.count
        )
      ), 
      id: id
    );

    late ProductModel dataFinal;
    if (dataSource.response?.data case Map<String, dynamic> dataResponse when dataSource.status == ResponseCodeEnum.success){
      dataFinal = ProductModel.fromJson(dataResponse);
    } else {
      dataFinal = ProductModel.empty();
    }

    return GenericModelOrEntityResponse<ProductModel>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: dataFinal
    );
  }
  
}