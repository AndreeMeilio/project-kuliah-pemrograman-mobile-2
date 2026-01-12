class UserAddress {
    Geolocation? geolocation;
    String? city;
    String? street;
    int? number;
    String? zipcode;

    UserAddress({
        this.geolocation,
        this.city,
        this.street,
        this.number,
        this.zipcode,
    });
}

class Geolocation {
    String? lat;
    String? long;

    Geolocation({
        this.lat,
        this.long,
    });
}