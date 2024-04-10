class BlockFAQItem {
  String? title;
  List<FAQItemModel>? faqItems;

  BlockFAQItem({
    this.title,
    this.faqItems,
  });

  BlockFAQItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['faqs'] != null) {
      faqItems = <FAQItemModel>[];
      json['faqs'].forEach((v) {
        faqItems!.add(FAQItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (faqItems != null) {
      data['faqs'] = faqItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FAQItemModel {
  FAQItemModel({
    this.question,
    this.answer,
  });

  FAQItemModel.fromJson(dynamic json) {
    question = json['question'];
    answer = json['answer'];
  }

  String? question;
  String? answer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question'] = question;
    map['answer'] = answer;

    return map;
  }
}
