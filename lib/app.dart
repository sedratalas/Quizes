import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_1/question2/screens/languages_screen.dart';
import 'package:quiz_1/question3/screens/user_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: UserListScreen(),
    );
  }
}
