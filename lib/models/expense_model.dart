class ExpenseModel {
  final int? id;
  final String title;
  final double amount;
  final String date;
  final String category;

  ExpenseModel({
    this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date,
      'category': category,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'] as int?,
      title: map['title'] as String,
      amount: map['amount'] as double,
      date: map['date'] as String,
      category: map['category'] as String,
    );
  }
}
