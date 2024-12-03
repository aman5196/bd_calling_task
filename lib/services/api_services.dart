import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/object_model.dart';


class ApiService {
  static const String apiUrl = 'https://api.restful-api.dev/objects';

  Future<List<ObjectModel>> fetchObjects() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => ObjectModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load objects');
    }
  }
}
