import 'package:expense/models/cost.dart';

class ExpenseType{
  final String? name;
  final double? maxAmount;
  final List<Cost> expenses;

  ExpenseType({required this.name, required this.maxAmount, required this.expenses});
}