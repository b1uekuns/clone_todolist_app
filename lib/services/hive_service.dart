import 'package:hive_flutter/hive_flutter.dart';
import 'package:ytb/entities/category_hive_entity.dart';

class HiveService {
  static const String _categoryBoxName = 'categories';
  static Box<CategoryHiveEntity>? _categoryBox;

  static Future<void> init() async {
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(CategoryHiveEntityAdapter());

    // Open boxes
    _categoryBox = await Hive.openBox<CategoryHiveEntity>(_categoryBoxName);
  }

  static Box<CategoryHiveEntity> get categoryBox {
    if (_categoryBox == null) {
      throw Exception(
        'HiveService not initialized. Call HiveService.init() first.',
      );
    }
    return _categoryBox!;
  }

  // Category operations
  static Future<void> createCategory({
    required String name,
    int? iconCodePoint,
    String? backgroundColorHex,
    String? iconColorHex,
  }) async {
    final category = CategoryHiveEntity(
      name: name,
      iconCodePoint: iconCodePoint,
      backgroundColorHex: backgroundColorHex,
      iconColorHex: iconColorHex,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isActive: true,
      sortOrder: categoryBox.length,
    );

    await categoryBox.add(category);
  }

  static List<CategoryHiveEntity> getAllCategories() {
    return categoryBox.values.where((category) => category.isActive).toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  }

  static Future<void> updateCategory(CategoryHiveEntity category) async {
    category.updatedAt = DateTime.now();
    await category.save();
  }

  static Future<void> deleteCategory(CategoryHiveEntity category) async {
    category.isActive = false;
    category.updatedAt = DateTime.now();
    await category.save();
  }

  static Future<void> hardDeleteCategory(int index) async {
    await categoryBox.deleteAt(index);
  }

  static CategoryHiveEntity? getCategoryByIndex(int index) {
    if (index >= 0 && index < categoryBox.length) {
      return categoryBox.getAt(index);
    }
    return null;
  }

  static List<CategoryHiveEntity> searchCategories(String query) {
    return categoryBox.values
        .where(
          (category) =>
              category.isActive &&
              category.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  static Future<void> close() async {
    await _categoryBox?.close();
  }

  static Future<void> clearAllData() async {
    await categoryBox.clear();
  }
}
