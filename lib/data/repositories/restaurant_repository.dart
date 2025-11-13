import 'package:dio/dio.dart';
import 'package:rest_well_aurant/data/core/api_config.dart';
import 'package:rest_well_aurant/data/core/api_constant.dart';
import 'package:rest_well_aurant/data/core/api_response.dart';
import 'package:rest_well_aurant/data/models/customer_review_model.dart';
import 'package:rest_well_aurant/data/models/restaurant_model.dart';

typedef GenericListRestaurant = ApiResponse<List<Restaurant>>;
typedef GenericRestaurant = ApiResponse<Restaurant>;
typedef GenericReview = ApiResponse<List<CustomerReview>>;

class RestaurantRepository {
  final api = ApiConfig.instance();

  RestaurantRepository._();

  static RestaurantRepository? instance;

  factory RestaurantRepository(){
    return RestaurantRepository._();
  }

  static RestaurantRepository getInstance(){
    return instance ??= RestaurantRepository();
  }

  Future<GenericListRestaurant> getAllRestaurant() async{
    try {
      final response = await api.get(ApiConstant.endpointListRestaurant);

      return GenericListRestaurant(
        error: response.data["error"], 
        message: response.data["message"], 
        data: List<Restaurant>.from(
          response.data["restaurants"].map((data) => Restaurant.fromJson(data))
        )
      );
    } on DioException catch(e){
      return GenericListRestaurant(
        error: true, 
        message: e.response?.data["message"], 
        data: []
      );
    } catch (error){
      return GenericListRestaurant(
        error: true, 
        message: "Terjadi kesalahan, silakan coba kembali beberapa saat!", 
        data: []
      );
    }
  }

  Future<GenericRestaurant> getDetailRestaurant({required String id}) async{
    try {
      final response = await api.get("${ApiConstant.endpointListDetail}/$id");

      return GenericRestaurant(
        error: response.data["error"],
        message: response.data["message"],
        data: Restaurant.fromJson(response.data["restaurant"])
      );
    } on DioException catch(e){
      return GenericRestaurant(
        error: true, 
        message: e.response?.data["message"],
        data: Restaurant.empty()
      );
    } catch (error){
      return GenericRestaurant(
        error: true, 
        message: "Terjadi kesalahan, silakan coba kembali beberapa saat!", 
        data: Restaurant.empty()
      );
    }
  }

  Future<GenericListRestaurant> searchRestaurant({required String key}) async{
    try {
      final response = await api.get(
        ApiConstant.endpointSearchRestaurant,
        queryParameters: <String, dynamic>{
          "q": key
        }
      );

      return GenericListRestaurant(
        error: response.data["error"],
        message: int.parse(response.data["founded"].toString()) > 0 ? "Data ditemukan" : "Data tidak ditemukan",
        data: List<Restaurant>.from(
          response.data["restaurants"].map((data) => Restaurant.fromJson(data))
        )
      );
    } on DioException catch(e){
      return GenericListRestaurant(
        error: true, 
        message: e.response?.data["message"], 
        data: []
      );
    } catch (error){
      return GenericListRestaurant(
        error: true, 
        message: "Terjadi kesalahan, silakan coba kembali beberapa saat!", 
        data: []
      );
    }
  }

  Future<GenericReview> addNewReview({required String id, required CustomerReview review}) async{
    try {
      final response = await api.post(
        ApiConstant.endpointAddReview,
        data: {
          "id" : id,
          "name": review.name,
          "review": review.review 
        },
      );

      return GenericReview(
        error: response.data["error"],
        message: response.data["message"],
        data: List<CustomerReview>.from(
          response.data["customerReviews"].map((data) => CustomerReview.fromJson(data))
        )
      );
    } on DioException catch(e){
      return GenericReview(
        error: true, 
        message: e.response?.data["message"], 
        data: []
      );
    } catch (error){
      return GenericReview(
        error: true, 
        message: "Terjadi kesalahan, silakan coba kembali beberapa saat!", 
        data: []
      );
    }
  }
}
