import 'dart:math';

import 'package:expense/models/cost.dart';
import 'package:expense/models/type.dart';

final rand = Random();

final List<double> weeklySpending=[
  rand.nextDouble()*100,
  rand.nextDouble()*100,
  rand.nextDouble()*100,
  rand.nextDouble()*100,
  rand.nextDouble()*100,
  rand.nextDouble()*100,
  rand.nextDouble()*100,
];

List<Cost> _generateExpenses(){
  List<Cost> cost=[
    Cost(name: 'item 1', cost: rand.nextDouble()*90),
    Cost(name: 'item 2', cost: rand.nextDouble()*90),
    Cost(name: 'item 3', cost: rand.nextDouble()*90),
    Cost(name: 'item 4', cost: rand.nextDouble()*90),
    Cost(name: 'item 5', cost: rand.nextDouble()*90),
    Cost(name: 'item 6', cost: rand.nextDouble()*90),
  ];
  return cost;
}

List<ExpenseType> typeNames=[
  ExpenseType(name: 'Car', maxAmount: 1500, expenses: _generateExpenses()),
  ExpenseType(name: 'Clothes', maxAmount: 500, expenses: _generateExpenses()),
  ExpenseType(name: 'Food', maxAmount: 600, expenses: _generateExpenses()),
  ExpenseType(name: 'Entertainment', maxAmount: 400, expenses: _generateExpenses()),
  ExpenseType(name: 'Rent', maxAmount: 1000, expenses: _generateExpenses()),
  ExpenseType(name: 'Utilities', maxAmount: 300, expenses: _generateExpenses()),
];