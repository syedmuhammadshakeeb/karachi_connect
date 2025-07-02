

class ChatModel {
    String? senderId;
    String? receiverId;
    String? text;
    String? id;
    DateTime? timestamp;
    int? v;

    ChatModel({
        this.senderId,
        this.receiverId,
        this.text,
        this.id,
        this.timestamp,
        this.v,
    });

    factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        senderId: json["senderId"],
        receiverId: json["receiverId"],
        text: json["text"],
        id: json["_id"],
        timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "senderId": senderId,
        "receiverId": receiverId,
        "text": text,
        "_id": id,
        "timestamp": timestamp?.toIso8601String(),
        "__v": v,
    };

    static List<ChatModel> fromJsonList(List<dynamic> jsonList) {
      return jsonList.map((json) => ChatModel.fromJson(json)).toList();
    }
}

