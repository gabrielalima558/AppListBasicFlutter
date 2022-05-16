import 'package:flutter/material.dart';
import 'package:gabriela_app/list_user_page/listUserPage.dart';
import 'package:gabriela_app/theme/theme_constants.dart';

void main() {
  runApp(MyApp());
}

//statefulwidget como chamar aqui

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: lightTheme, home: ListUserPage());
  }
}
