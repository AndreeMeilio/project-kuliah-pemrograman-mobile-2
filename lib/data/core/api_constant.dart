
class ApiConstant {
  static String baseUrl = "https://restaurant-api.dicoding.dev";
  static Duration connectTimeout = const Duration(seconds: 5);
  static Duration receiveTimeout = const Duration(seconds: 3);

  static String endpointListRestaurant = "/list";
  static String endpointListDetail = "/detail";
  static String endpointSearchRestaurant = "/search";
  static String endpointAddReview = "/review";
  static String endpointRestaurantImage = "https://restaurant-api.dicoding.dev/images/medium/";
}