import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/todo_provider.dart';
import 'package:todo_app_provider/todo_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:  (context)=> TodoProivder(),
      child: MaterialApp(
        
        home:TodoScreen() ,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}