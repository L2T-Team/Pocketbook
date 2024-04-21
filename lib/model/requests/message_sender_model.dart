class MessageSenderModel {
  MessageSenderModel({
    this.message,
    required this.type,
  });

  final int type;
  final dynamic message;

  factory MessageSenderModel.fromJson(Map<String, dynamic> json) =>
      MessageSenderModel(
        message: json["body"],
        type: json["type"] as int,
      );

  Map<String, dynamic> toJson() => {
        "body": message,
        "type": type,
      };
}
