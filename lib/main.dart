import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/addtask.dart';
import 'package:todo_app/screens/mainpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddTask(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To-do App',
        theme: ThemeData(
          primaryColor: const Color(0xffe8eaf6),
          accentColor: const Color(0xff29b6f6),
        ),
        home: MainPage(),
      ),
    );
  }
}
