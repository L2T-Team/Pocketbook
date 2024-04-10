class WebSocketMessageDataModel {
  WebSocketMessageDataModel({
    this.message,
    required this.type,
  });

  final int type;
  final dynamic message;

  factory WebSocketMessageDataModel.fromJson(Map<String, dynamic> json) =>
      WebSocketMessageDataModel(
        message: json["body"],
        type: json["type"] as int,
      );

  Map<String, dynamic> toJson() => {
        "body": message,
        "type": type,
      };
}
