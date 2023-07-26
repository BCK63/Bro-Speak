class AuthSignUpModel {
    String name;
    String email;
    String password;
    String batch;

    AuthSignUpModel({
        required this.name,
        required this.email,
        required this.password,
        required this.batch,
    });

    factory AuthSignUpModel.fromJson(Map<String, dynamic> json) => AuthSignUpModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        batch: json["batch"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "batch": batch,
    };
}

class AdminInviteModel {
    String? email;

    AdminInviteModel({
        this.email,
    });

    factory AdminInviteModel.fromJson(Map<String, dynamic> json) => AdminInviteModel(
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
    };
}
