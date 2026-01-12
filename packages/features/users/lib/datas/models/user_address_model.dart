class UserAddressModel {
    GeolocationModel? geolocation;
    String? city;
    String? street;
    int? number;
    String? zipcode;

    UserAddressModel({
        this.geolocation,
        this.city,
        this.street,
        this.number,
        this.zipcode,
    });

    factory UserAddressModel.fromJson(Map<String, dynamic> json) => UserAddressModel(
        geolocation: json["geolocation"] == null ? null : GeolocationModel.fromJson(json["geolocation"]),
        city: json["city"],
        street: json["street"],
        number: json["number"],
        zipcode: json["zipcode"],
    );

    Map<String, dynamic> toJson() => {
        "geolocation": geolocation?.toJson(),
        "city": city,
        "street": street,
        "number": number,
        "zipcode": zipcode,
    };
}

class GeolocationModel {
    String? lat;
    String? long;

    GeolocationModel({
        this.lat,
        this.long,
    });

    factory GeolocationModel.fromJson(Map<String, dynamic> json) => GeolocationModel(
        lat: json["lat"],
        long: json["long"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
    };
}