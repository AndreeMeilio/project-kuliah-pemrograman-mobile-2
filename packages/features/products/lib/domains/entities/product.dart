
import 'package:products/domains/entities/product_rating.dart';

class Product {
    int? id;
    String? title;
    double? price;
    String? description;
    String? category;
    String? image;
    ProductRating? rating;

    Product.empty();

    Product({
        this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating,
    });
}