class ApiEndpoint {
  static const String cart = "/carts";
  static String cartWithId({required String id}) => "/carts/$id";
  static String cartUserWithId({required String id}) => "/carts/user/$id"; 
}