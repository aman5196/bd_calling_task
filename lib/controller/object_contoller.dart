import 'package:get/get.dart';
import '../model/object_model.dart';
import '../services/api_services.dart';


class ObjectController extends GetxController {
  var objects = <ObjectModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchObjects();
    super.onInit();
  }

  void fetchObjects() async {
    try {
      isLoading(true);
      var data = await ApiService().fetchObjects();
      objects.assignAll(data);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load data');
    } finally {
      isLoading(false);
    }
  }
}
