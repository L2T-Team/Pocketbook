import 'package:pocketbook/model/responses/transaction_model.dart';

class CategoryModel {
  String? id;
  String? name;
  String? type;
  String? image;
  List<TransactionModel> listTrans = [];

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
