// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  String? id;
  String? title;
  String? summary;
  String? description;
  bool? investorNeeded;
  CreatedBy? createdBy;
  List<Comment>? comments;

  PostModel({
    this.id,
    this.title,
    this.summary,
    this.description,
    this.investorNeeded,
    this.createdBy,
    this.comments,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["_id"],
        title: json["title"],
        summary: json["summary"],
        description: json["description"],
        investorNeeded: json["investorNeeded"],
        createdBy: json["createdBy"] == null
            ? null
            : CreatedBy.fromJson(json["createdBy"]),
        comments: json["comments"] == null
            ? []
            : List<Comment>.from(
                json["comments"]!.map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "summary": summary,
        "description": description,
        "investorNeeded": investorNeeded,
        "createdBy": createdBy?.toJson(),
        "comments": comments == null
            ? []
            : List<dynamic>.from(comments!.map((x) => x.toJson())),
      };
  static List<PostModel>? fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => PostModel.fromJson(json)).toList();
  }
}

class Comment {
  UserId? userId;
  String? content;
  String? id;
  DateTime? createdAt;

  Comment({
    this.userId,
    this.content,
    this.id,
    this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        content: json["content"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId?.toJson(),
        "content": content,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class UserId {
  String? id;
  String? name;
  String? email;

  UserId({
    this.id,
    this.name,
    this.email,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
      };
}

class CreatedBy {
  dynamic profileImage;
  String? id;
  String? name;

  CreatedBy({
    this.profileImage,
    this.id,
    this.name,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        profileImage: json["profileImage"],
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "profileImage": profileImage,
        "_id": id,
        "name": name,
      };
}
