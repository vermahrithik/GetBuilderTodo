import 'package:flutter/material.dart';
import 'package:getxtodo/src/controllers/taskController.dart';
import 'package:getxtodo/src/views/screens/todopage.dart';
import 'package:get/get.dart';
void main() {
  Get.put(TaskController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const TodoPage(),
    );
  }
}

