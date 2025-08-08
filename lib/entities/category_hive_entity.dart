import 'package:hive/hive.dart';

part 'category_hive_entity.g.dart';

@HiveType(typeId: 0)
class CategoryHiveEntity extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int? iconCodePoint;

  @HiveField(2)
  String? backgroundColorHex;

  @HiveField(3)
  String? iconColorHex;

  @HiveField(4)
  DateTime createdAt;

  @HiveField(5)
  DateTime updatedAt;

  @HiveField(6)
  bool isActive;

  @HiveField(7)
  int sortOrder;

  CategoryHiveEntity({
    required this.name,
    this.iconCodePoint,
    this.backgroundColorHex,
    this.iconColorHex,
    required this.createdAt,
    required this.updatedAt,
    this.isActive = true,
    this.sortOrder = 0,
  });

  // Helper methods
  String get displayName => name;

  bool get hasIcon => iconCodePoint != null;

  bool get hasBackgroundColor => backgroundColorHex != null;

  bool get hasIconColor => iconColorHex != null;
}
