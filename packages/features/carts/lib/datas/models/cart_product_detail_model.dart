class CartProductDetailModel {
    int? productId;
    int? quantity;

    CartProductDetailModel({
        this.productId,
        this.quantity,
    });

    factory CartProductDetailModel.fromJson(Map<String, dynamic> json) => CartProductDetailModel(
        productId: json["productId"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
    };
}