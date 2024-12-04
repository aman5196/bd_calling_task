import 'package:bd_calling_task/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'model/object_model.dart'; // Import GetX package

void main() async {
  await Hive.initFlutter(); // Initialize Hive
  Hive.registerAdapter(ObjectModelAdapter()); // Register the ObjectModel adapter
  await Hive.openBox('objectsBox'); // Open the Hive box

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Use GetMaterialApp instead of MaterialApp
      title: 'REST API Demo',
      home: HomeScreen(), // Start with the HomeScreen
      debugShowCheckedModeBanner: false,
    );
  }
}
