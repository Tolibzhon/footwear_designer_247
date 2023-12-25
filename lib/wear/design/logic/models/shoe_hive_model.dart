import 'package:hive_flutter/hive_flutter.dart';
part 'shoe_hive_model.g.dart';

@HiveType(typeId: 1)
class ShoeHiveModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String imagePath;
  @HiveField(3)
  final String material;
  @HiveField(4)
  final int shoeSize;
  @HiveField(5)
  final int heelHight;
  @HiveField(6)
  final String toeShoes;
  @HiveField(7)
  final List<String> additionalInserts;
  @HiveField(8)
  final List<String> primaryColors;

  ShoeHiveModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.material,
    required this.shoeSize,
    required this.heelHight,
    required this.toeShoes,
    required this.additionalInserts,
    required this.primaryColors,
  });
}
