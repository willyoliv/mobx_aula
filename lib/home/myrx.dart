import 'package:flutter/material.dart';

class MyRx<T> implements Listenable {
  final _callbacks = <VoidCallback>[];

  MyRx(initialValue) : _value = initialValue;

  T _value;

  T get value => _value;

  set value(T newValue) {
    _value = newValue;
    _notifyListeners();
  }

  @override
  void addListener(VoidCallback listener) {
    _callbacks.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _callbacks.remove(listener);
  }

  void _notifyListeners() {
    if (_callbacks.isEmpty) return;

    for (var _callback in _callbacks) {
      _callback();
    }
  }
}

void main(List<String> args) {
  final nameRx = MyRx<String>('Willy');

  nameRx.addListener(() {
    print('listen 1: ${nameRx.value}');
  });
  nameRx.addListener(() {
    print('listen 2: ${nameRx.value}');
  });

  nameRx.value = 'Jonatas';
  nameRx.value = 'Clodoaldo';
}
