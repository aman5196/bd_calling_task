import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../model/object_model.dart';
import '../services/api_services.dart';

class ObjectController extends GetxController {
  var objects = <ObjectModel>[].obs; // Observable list of objects
  var isLoading = false.obs; // Loading state

  final ApiService apiService = ApiService(); // API service

  @override
  void onInit() {
    super.onInit();
    fetchObjects();
  }

  // Fetch objects from API or Hive cache
  Future<void> fetchObjects() async {
    isLoading(true); // Start loading
    try {
      var box = await Hive.openBox('objectsBox');
      // Fetch data from the API service (it will use cache if offline)
      List<ObjectModel> fetchedObjects = await apiService.fetchObjects();
      objects.value = fetchedObjects; // Update the objects list

      // Save the fetched data to Hive
      await box.put('objects', fetchedObjects);
    } catch (e) {
      print('Error fetching objects: $e');
      // Load data from Hive if there's an error
      var box = await Hive.openBox('objectsBox');
      var savedObjects = box.get('objects', defaultValue: []);
      if (savedObjects.isNotEmpty) {
        objects.value = savedObjects.cast<ObjectModel>();
      }
    } finally {
      isLoading(false); // Stop loading
    }
  }
}