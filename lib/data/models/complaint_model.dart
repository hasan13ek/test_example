class ComplaintModel {
  int toUserId;
  String category;
  String text;

  ComplaintModel({
    required this.toUserId,
    required this.category,
    required this.text,
  });

  factory ComplaintModel.fromJson(Map<String, dynamic> jsonData) {
    return ComplaintModel(
      toUserId: jsonData['to_user_id'],
      category: jsonData['category'],
      text: jsonData['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "to_user_id": toUserId,
      "category": category,
      "text": text,
    };
  }
}
