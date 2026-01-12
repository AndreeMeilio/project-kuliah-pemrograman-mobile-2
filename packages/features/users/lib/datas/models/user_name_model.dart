class UserNameModel {
    String? firstname;
    String? lastname;

    UserNameModel({
        this.firstname,
        this.lastname,
    });

    factory UserNameModel.fromJson(Map<String, dynamic> json) => UserNameModel(
        firstname: json["firstname"],
        lastname: json["lastname"],
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
    };
}