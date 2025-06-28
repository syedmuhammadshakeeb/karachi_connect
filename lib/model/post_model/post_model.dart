
class PostModel {
    String? title;
    String? summary;
    String? description;
    bool? investorNeeded;
    bool? developersNeeded;
    String? createdBy;
    String? id;
    List<dynamic>? comments;
    List<dynamic>? viewers;
    int? v;

    PostModel({
        this.title,
        this.summary,
        this.description,
        this.investorNeeded,
        this.developersNeeded,
        this.createdBy,
        this.id,
        this.comments,
        this.viewers,
        this.v,
    });

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        title: json["title"],
        summary: json["summary"],
        description: json["description"],
        investorNeeded: json["investorNeeded"],
        developersNeeded: json["developersNeeded"],
        createdBy: json["createdBy"],
        id: json["_id"],
        comments: json["comments"] == null ? [] : List<dynamic>.from(json["comments"]!.map((x) => x)),
        viewers: json["viewers"] == null ? [] : List<dynamic>.from(json["viewers"]!.map((x) => x)),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "summary": summary,
        "description": description,
        "investorNeeded": investorNeeded,
        "developersNeeded": developersNeeded,
        "createdBy": createdBy,
        "_id": id,
        "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x)),
        "viewers": viewers == null ? [] : List<dynamic>.from(viewers!.map((x) => x)),
        "__v": v,
    };
}