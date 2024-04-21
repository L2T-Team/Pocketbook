class AvatarModel {
  String? id;
  String? avatar;

  AvatarModel({
    this.id,
    this.avatar,
  });

  AvatarModel.fromJson(dynamic json) {
    id = json['id'] ?? '';
    avatar = json['avatar'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'avatar': avatar,
    };
  }
}

class UserNameModel {
  String? id;
  String? username;

  UserNameModel({
    this.id,
    this.username,
  });

  UserNameModel.fromJson(dynamic json) {
    id = json['id'] ?? '';
    username = json['username'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
    };
  }
}
