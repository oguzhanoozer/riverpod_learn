import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Student extends ChangeNotifier {
  int totalStudents = 0;

  void changeStudents() {
    totalStudents = 50;
    notifyListeners();
  }
}
