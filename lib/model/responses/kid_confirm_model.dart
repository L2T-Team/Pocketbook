class KidConfirmModel {
  String? id;
  String? date;
  KidConfirmModel({
    this.id,
    this.date,
  });

  KidConfirmModel.fromJson(dynamic json) {
    id = json['id'] ?? '';
    date = json['date'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
    };
  }
}

class KidGroupConfirmModel {
  int month;
  List<KidConfirmModel> listKids;
  bool isDropdown = false;
  KidGroupConfirmModel({
    required this.month,
    required this.listKids,
    required this.isDropdown,
  });
}
