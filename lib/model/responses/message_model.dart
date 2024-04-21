class MessageModel {
  MessageModel({
    this.message,
    this.senderId,
    this.conversationId,
  });

  MessageModel.fromJson(dynamic json) {
    message = json['message'];
    senderId = json['sender_id'];
    conversationId = json['socket_id'];
  }

  String? message;
  String? senderId;
  String? conversationId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['sender_id'] = senderId;
    map['socket_id'] = conversationId;
    return map;
  }
}
