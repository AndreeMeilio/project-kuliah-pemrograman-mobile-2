class ProductRatingModel {
    double? rate;
    int? count;

    ProductRatingModel({
        this.rate,
        this.count,
    });

    factory ProductRatingModel.fromJson(Map<String, dynamic> json) => ProductRatingModel(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}
