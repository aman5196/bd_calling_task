import 'package:hive/hive.dart';
part 'object_model.g.dart';

@HiveType(typeId: 0)
class ObjectModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final Map<String, dynamic>? data;

  ObjectModel({required this.id, required this.name, this.data});
//ObjectModel instance created from json map
  factory ObjectModel.fromJson(Map<String, dynamic> json) {
    return ObjectModel(
      id: json['id'].toString(),
      name: json['name'],
      data: json['data'] != null ? Map<String, dynamic>.from(json['data']) : null,
    );
  }

  // This method will be useful when you want to save the model into a Map before storing it in Hive
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'data': data,
    };
  }
}
