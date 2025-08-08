import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ytb/entities/category_hive_entity.dart';
import 'package:ytb/services/hive_service.dart';

class CreateOrEditCategory extends StatefulWidget {
  const CreateOrEditCategory({super.key});

  @override
  State<CreateOrEditCategory> createState() => _CreateOrEditCategoryState();
}

class _CreateOrEditCategoryState extends State<CreateOrEditCategory> {
  final _nameTextController = TextEditingController();
  final List<Color> _colorDataSource = [];
  Color? colorSelected;
  Color? iconColorSelected;
  IconData? selectedIcon;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _colorDataSource.addAll(const [
      Color(0xFFC9CC41),
      Color(0xFF66CC41),
      Color(0xFF41CCA7),
      Color(0xFF4181CC),
      Color(0xFF41A2CC),
      Color(0xFFCC8441),
      Color(0xFF9741CC),
      Color(0xFFCC4173),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          "Create new category",
          style: TextStyle(
            color: Colors.white.withOpacity(0.87),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Lato",
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(child: _buildBodyPageScreen()),
    );
  }

  Widget _buildBodyPageScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _createCategoryNameField(),
        _createCategoryIconField(),
        _createCategoryIconColorField(),
        _createCategoryColorField(),
        const Spacer(),
        _buildCancelAndCreateCategoryButton(),
      ],
    );
  }

  Widget _createCategoryNameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label('Category name:'),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: _nameTextController,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: "Lato",
              ),
              decoration: InputDecoration(
                hintText: "Category Name".tr(),
                hintStyle: const TextStyle(
                  color: Color(0xFFAFAFAF),
                  fontSize: 16,
                  fontFamily: "Lato",
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xFF979797),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createCategoryIconField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label('Category icon:'.tr()),
          GestureDetector(
            onTap: _chooseIcon,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF).withOpacity(0.21),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (selectedIcon != null) ...[
                      Icon(
                        selectedIcon,
                        color: Colors.white.withOpacity(0.87),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Icon selected',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.87),
                          fontSize: 12,
                          fontFamily: "Lato",
                        ),
                      ),
                    ] else ...[
                      Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white.withOpacity(0.87),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Choose icon from library'.tr(),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.87),
                          fontSize: 12,
                          fontFamily: "Lato",
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createCategoryIconColorField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label('Icon color:'),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _colorDataSource.length,
              itemBuilder: (context, index) {
                final color = _colorDataSource[index];
                final isSelected = iconColorSelected == color;
                return GestureDetector(
                  onTap: () => setState(() => iconColorSelected = color),
                  child: Container(
                    width: 36,
                    height: 36,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Colors.white : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: isSelected
                        ? const Icon(Icons.check, color: Colors.white, size: 18)
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _createCategoryColorField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label('Category color:'.tr()),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _colorDataSource.length,
              itemBuilder: (context, index) {
                final color = _colorDataSource[index];
                final isSelected = colorSelected == color;
                return GestureDetector(
                  onTap: () => setState(() => colorSelected = color),
                  child: Container(
                    width: 36,
                    height: 36,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Colors.white : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: isSelected
                        ? const Icon(Icons.check, color: Colors.white, size: 18)
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCancelAndCreateCategoryButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: [
          TextButton(
            onPressed: () => Navigator.maybePop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Color(0xFF8687E7),
                fontSize: 16,
                fontFamily: "Lato",
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: _isLoading ? null : _onHandleCreateCategory,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8687E7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Text(
                    'Create Category',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Lato",
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _label(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white.withOpacity(0.87),
        fontSize: 16,
        fontFamily: "Lato",
      ),
    );
  }

  void _chooseIcon() {
    // List of popular icons for categories
    final List<IconData> categoryIcons = [
      Icons.work,
      Icons.home,
      Icons.shopping_cart,
      Icons.fitness_center,
      Icons.school,
      Icons.restaurant,
      Icons.local_hospital,
      Icons.directions_car,
      Icons.flight,
      Icons.music_note,
      Icons.sports_soccer,
      Icons.pets,
      Icons.book,
      Icons.computer,
      Icons.phone,
      Icons.email,
      Icons.favorite,
      Icons.star,
      Icons.cake,
      Icons.coffee,
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF363636),
        title: Text(
          'Choose Icon',
          style: TextStyle(
            color: Colors.white.withOpacity(0.87),
            fontFamily: "Lato",
          ),
        ),
        content: SizedBox(
          width: double.maxFinite,
          height: 300,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: categoryIcons.length,
            itemBuilder: (context, index) {
              final icon = categoryIcons[index];
              return GestureDetector(
                onTap: () {
                  setState(() => selectedIcon = icon);
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIcon == icon
                        ? const Color(0xFF8687E7)
                        : Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: Colors.white, size: 30),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Color(0xFF8687E7)),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onHandleCreateCategory() async {
    final name = _nameTextController.text.trim();

    // Validation
    if (name.isEmpty) {
      _toast('Please enter category name');
      return;
    }
    if (selectedIcon == null) {
      _toast('Please choose an icon');
      return;
    }
    if (colorSelected == null) {
      _toast('Please choose a category color');
      return;
    }
    if (iconColorSelected == null) {
      _toast('Please choose an icon color');
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Use HiveService instead of IsarService
      await HiveService.createCategory(
        name: name,
        iconCodePoint: selectedIcon!.codePoint,
        backgroundColorHex: _colorToHex(colorSelected!),
        iconColorHex: _colorToHex(iconColorSelected!),
      );

      if (mounted) {
        _toast('Category "$name" created successfully!');
        Navigator.maybePop(context, true);
      }
    } catch (e) {
      _toast('Save failed: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _toast(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), behavior: SnackBarBehavior.floating),
    );
  }

  /// Convert Color to hex string #AARRGGBB
  String _colorToHex(Color c) =>
      '#${c.alpha.toRadixString(16).padLeft(2, '0')}${c.red.toRadixString(16).padLeft(2, '0')}${c.green.toRadixString(16).padLeft(2, '0')}${c.blue.toRadixString(16).padLeft(2, '0')}';

  @override
  void dispose() {
    _nameTextController.dispose();
    super.dispose();
  }
}
