import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/object_contoller.dart';

class ObjectListScreen extends StatelessWidget {
  final ObjectController objectController = Get.put(ObjectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Objects List')),
      body: Obx(() {
        if (objectController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (objectController.objects.isEmpty) {
          return Center(child: Text('No data available'));
        }

        return ListView.builder(
          itemCount: objectController.objects.length,
          itemBuilder: (context, index) {
            var object = objectController.objects[index];
            return ListTile(
              title: Text(object.name),
              subtitle: object.data != null
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: object.data!.entries.map((entry) {
                  return Text('${entry.key}: ${entry.value}');
                }).toList(),
              )
                  : Text('No additional data'),
            );
          },
        );
      }),
    );
  }
}
