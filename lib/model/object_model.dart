class ObjectModel {
  final String id;
  final String name;
  final Map<String, dynamic>? data;

  ObjectModel({required this.id, required this.name, this.data});

  factory ObjectModel.fromJson(Map<String, dynamic> json) {
    return ObjectModel(
      id: json['id'].toString(),
      name: json['name'],
      data: json['data'] != null ? Map<String, dynamic>.from(json['data']) : null,
    );
  }
}
