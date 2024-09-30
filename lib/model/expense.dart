// data model
import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

final formatter = DateFormat.yMd(); //DateFormat.yMd creates formatter object

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
}

const categoryIcons = {
  //keys are categories, values are icons associated
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.amount,
    required this.title,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // initializer list

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category; // use custom enum type Category

  //getter
  String get formattedDate {
    return formatter
        .format(date); //calling format function on format, send it date
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });
  // creating new, alternative constructor function
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category) //if expense matches, keep, otherwise drop
            .toList(); 

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
