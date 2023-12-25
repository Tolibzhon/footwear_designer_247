import 'package:hive_flutter/hive_flutter.dart';
part 'shoe_hive_model.g.dart';

@HiveType(typeId: 1)
class ShoeHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String imagePath;
  @HiveField(3)
  String material;
  @HiveField(4)
  int shoeSize;
  @HiveField(5)
  int heelHight;
  @HiveField(6)
  String toeShoes;
  @HiveField(7)
  List<String> additionalInserts;
  @HiveField(8)
  List<String> primaryColors;

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
