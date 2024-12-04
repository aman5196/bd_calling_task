import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/weather_model.dart';

class WeatherController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var currentWeather = Rx<WeatherModel?>(null);
  var forecast = RxList<ForecastModel>([]);

  Future<void> fetchWeather(String city) async {
    if (city.trim().isEmpty) {
      errorMessage.value = 'Please enter a city name.';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.get(
        Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=ce5ee56c1bdd4bb0d266602076d6c26b&units=metric'),
      );


      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        currentWeather.value = WeatherModel.fromJson(data);
      } else {
        errorMessage.value = 'Failed to fetch weather data.';
      }

      final forecastResponse = await http.get(
        Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=ce5ee56c1bdd4bb0d266602076d6c26b&units=metric'),
      );

      if (forecastResponse.statusCode == 200) {
        final forecastData = jsonDecode(forecastResponse.body);
        forecast.value = (forecastData['list'] as List)
            .map((forecastData) => ForecastModel.fromJson(forecastData))
            .toList();
      } else {
        errorMessage.value = 'Failed to load forecast.';
      }
    } catch (e) {
      errorMessage.value = 'An error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
