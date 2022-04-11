import 'package:flutter/material.dart';
import 'package:mobx_aula/github_repo/github_page.dart';

import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobx',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GitHubPage(title: 'Mobx'),
    );
  }
}
