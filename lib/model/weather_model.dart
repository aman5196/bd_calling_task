class WeatherModel {
  final String cityName;
  final double temperature;
  final String description;
  final String iconCode;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.iconCode,
  });

  // Factory method to create a WeatherModel from JSON
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
    );
  }
}

class ForecastModel {
  final String date;
  final double temperature;
  final String description;
  final String iconCode;

  ForecastModel({
    required this.date,
    required this.temperature,
    required this.description,
    required this.iconCode,
  });

  // Factory method to create a ForecastModel from JSON
  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      date: json['dt_txt'],
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
    );
  }
}
