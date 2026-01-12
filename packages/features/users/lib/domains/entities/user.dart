
import 'package:users/domains/entities/user_address.dart';
import 'package:users/domains/entities/user_name.dart';

class User {
    UserAddress? address;
    int? id;
    String? email;
    String? username;
    String? password;
    UserName? name;
    String? phone;
    int? v;

    User.empty();

    User({
        this.address,
        this.id,
        this.email,
        this.username,
        this.password,
        this.name,
        this.phone,
        this.v,
    });
}
