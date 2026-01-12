
import 'package:carts/domains/entities/cart_product_detail.dart';

class Cart {
    int? id;
    int? userId;
    DateTime? date;
    List<CartProductDetail>? detailProducts;
    int? v;

    Cart({
        this.id,
        this.userId,
        this.date,
        this.detailProducts,
        this.v,
    });
}
