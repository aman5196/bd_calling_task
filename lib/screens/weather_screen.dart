import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/weather_controller.dart';  // Import the GetX controller
import '../widgets/search_box.dart';  // Import the custom search box widget
import 'package:intl/intl.dart';

class WeatherScreen extends StatelessWidget {
  final WeatherController weatherController = Get.put(WeatherController());
  final TextEditingController cityController = TextEditingController(); // Controller for the search input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(title: Text('Weather App', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Replace TextField and Button with SearchBox
            SearchBox(
              controller: cityController, // Pass the TextEditingController here
              onTap: () {
                String city = cityController.text;
                if (city.isNotEmpty) {
                  weatherController.fetchWeather(city);
                }
              },
            ),
            SizedBox(height: 16),

            // Display weather or loading/error state
            Obx(() {
              if (weatherController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              if (weatherController.errorMessage.value.isNotEmpty) {
                return Text(
                  weatherController.errorMessage.value,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                );
              }
              if (weatherController.currentWeather.value != null) {
                final weather = weatherController.currentWeather.value!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${weather.cityName} - ${weather.temperature.toStringAsFixed(1)}°C',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      weather.description,
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: Image.network(
                        'https://openweathermap.org/img/wn/${weather.iconCode}@2x.png',
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ],
                );
              }
              return Container();
            }),

            // Display forecast
            Obx(() {
              if (weatherController.forecast.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: weatherController.forecast.length,
                    itemBuilder: (context, index) {
                      final forecast = weatherController.forecast[index];

                      // Format the date using the intl package
                      DateTime forecastDate = DateTime.parse(forecast.date);
                      String formattedDate = DateFormat('h:mm a, EEEE, MMM d, yyyy').format(forecastDate);


                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(16),
                          leading: Container(width: 50, height: 50, decoration: BoxDecoration(color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Image.network(
                              'https://openweathermap.org/img/wn/${forecast.iconCode}@2x.png', width: 40, height: 40,
                            ),
                          ),
                          title: Text(
                            formattedDate, // Use the formatted date
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(forecast.description),
                          trailing: Text(
                            '${forecast.temperature.toStringAsFixed(1)}°C',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return Container();
            }),
          ],
        ),
      ),
    );
  }
}
