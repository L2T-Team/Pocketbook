class CategoryModel {
  String? id;
  String? name;
  String? type;
  String? image;
  CategoryModel({
    this.id,
    this.name,
    this.type,
    this.image,
  });

  CategoryModel.fromJson(dynamic json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    type = json['type'] ?? '';
    image = json['image'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'image': image,
    };
  }
}
