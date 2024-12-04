import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/object_contoller.dart';

class ObjectListScreen extends StatelessWidget {
  final ObjectController objectController = Get.put(ObjectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Objects List', textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
    backgroundColor: Colors.blueAccent,  // You can change the color as per your theme
    centerTitle: true,  // Centers the title
    ),

      body: Obx(() {
        // Check if data is loading
        if (objectController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        // Check if no objects are available
        if (objectController.objects.isEmpty) {
          return Center(
            child: Text(
              'No data available',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          );
        }

        // Display the fetched objects in a ListView
        return ListView.builder(
          itemCount: objectController.objects.length,
          itemBuilder: (context, index) {
            var object = objectController.objects[index];

            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(
                  object.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent,),
                ),
                subtitle: object.data != null
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: object.data!.entries.map((entry) {
                    return Padding(padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        '${entry.key}: ${entry.value}',
                        style: TextStyle(fontSize: 14, color: Colors.black87,),
                      ),
                    );
                  }).toList(),
                )
                    : Padding(padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text('No additional data', style: TextStyle(fontSize: 14, color: Colors.grey,),),
                ),
                onTap: () {
                  // Handle tap event, you can navigate to another screen if needed
                  // Example: Navigator.push(...);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
