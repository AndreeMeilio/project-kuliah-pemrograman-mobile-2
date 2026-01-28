import 'package:products/products.dart';

class CartProductDetail {
    int? productId;
    int? quantity;
    Product? product;

    CartProductDetail({
        this.productId,
        this.quantity,
        this.product
    });
}