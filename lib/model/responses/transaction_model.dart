import 'package:pocketbook/model/responses/category_model.dart';

class TransactionModel {
  String? id;
  String? name;
  double? amount;
  CategoryModel? category;
  String? date;
  TransactionModel({
    this.id,
    this.name,
    this.amount,
    this.category,
    this.date,
  });

  TransactionModel.fromJson(dynamic json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    amount = json['amount'] ?? 0;
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    date = json['date'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'category': category?.toJson(),
      'date': date,
    };
  }
}

/// Group Transaction
class GroupTransactionModel {
  String date;
  List<TransactionModel> transaction;
  GroupTransactionModel({
    required this.date,
    required this.transaction,
  });
}
