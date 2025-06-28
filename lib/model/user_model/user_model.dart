class UserModel {
    String? id;
    String? name;
    String? email;
    String? role;
    bool? isVerified;
    String? token;

    UserModel({
        this.id,
        this.name,
        this.email,
        this.role,
        this.isVerified,
        this.token,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        isVerified: json["isVerified"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "role": role,
        "isVerified": isVerified,
        "token": token,
    };
}