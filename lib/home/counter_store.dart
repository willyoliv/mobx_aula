import 'package:flutter/material.dart';

class CounterStore {
  final counter = ValueNotifier<int>(0);

  void increment() {
    counter.value++;
  }
}
