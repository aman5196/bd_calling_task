import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_button.dart';
import 'object_list_screen.dart'; // Placeholder for your actual ObjectListScreen
import 'weather_screen.dart'; // Placeholder for your actual WeatherScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar:AppBar(
        title: const Text('Home', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: Colors.white),),
        backgroundColor: Colors.blueAccent, // Custom app bar color
        elevation: 4.0, // Add shadow
        centerTitle: true, // Center align the title
        actions: [
          IconButton(icon: const Icon(Icons.notifications,color: Colors.white,),
            onPressed: () {// Action for notifications
             },),],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: 'View Data',
              onPressed: () {
                Get.to(() => ObjectListScreen()); // Navigate to ObjectListScreen
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Check Weather',
              onPressed: () {
                Get.to(() => WeatherScreen()); // Navigate to WeatherScreen
              },
            ),
          ],
        ),
      ),
    );
  }
}

