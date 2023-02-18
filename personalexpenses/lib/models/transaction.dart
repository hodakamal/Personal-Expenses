// ignore_for_file: camel_case_types

class transaction {
  
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date
  });
}
