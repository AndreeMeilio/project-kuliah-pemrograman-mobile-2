class ApiEndpoint {
  static const String product = "/products";
  static String productWithId({required String id}) => "/products/$id";
  static const String productCategory = "/products/category";
  static String productWithCategory({required String category}) => "/products/category/$category";
}