class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? cnic;
  String? phone;
  String? role;
  bool? isVerified;
  String? ntn;
  int? numberOfProjectsInvestedIn;
  int? v;
  String? token;
  String? profileImage;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.cnic,
      this.phone,
      this.role,
      this.isVerified,
      this.ntn,
      this.numberOfProjectsInvestedIn,
      this.v,
      this.profileImage,
      this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        cnic: json["cnic"],
        phone: json["phone"],
        role: json["role"],
        isVerified: json["isVerified"],
        ntn: json["ntn"],
        numberOfProjectsInvestedIn: json["numberOfProjectsInvestedIn"],
        v: json["__v"],
        token: json["token"],
        profileImage: json["profileImage"],

      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "cnic": cnic,
        "phone": phone,
        "role": role,
        "isVerified": isVerified,
        "ntn": ntn,
        "numberOfProjectsInvestedIn": numberOfProjectsInvestedIn,
        "__v": v,
        "token": token,
        "profileImage": profileImage
      };
      static List<UserModel> fromJsonList(List<dynamic> jsonList) {
        return jsonList.map((json) => UserModel.fromJson(json)).toList();
      }
}

