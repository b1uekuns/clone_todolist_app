import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CreateOrEditCategory extends StatefulWidget {
  const CreateOrEditCategory({super.key});

  @override
  State<CreateOrEditCategory> createState() => _CreateOrEditCategoryState();
}

class _CreateOrEditCategoryState extends State<CreateOrEditCategory> {
  final _nameTextController = TextEditingController();
  final List<Color> _colorDataSource = [];
  Color? colorSelected;

  @override
  void initState() {
    super.initState();

    _colorDataSource.addAll([
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
      backgroundColor: Color(0xFF121212),
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _createCategoryNameField(),
        _createCategoryIconField(),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createCategoryTextField('Category name:'),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: _nameTextController,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: "Lato",
              ),
              decoration: InputDecoration(
                hintText: "Category Name".tr(),
                hintStyle: TextStyle(
                  color: Color(0xFFAFAFAF),
                  fontSize: 16,
                  fontFamily: "Lato",
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(width: 1, color: Color(0xFF979797)),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createCategoryTextField('Category icon:'.tr()),
          GestureDetector(
            onTap: () {
              // Logic to open icon selection dialog or screen
              print('Open icon selection dialog');
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF).withOpacity(0.21),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  'Choose icon from library',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.87),
                    fontSize: 12,
                    fontFamily: "Lato",
                  ),
                ).tr(),
              ),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createCategoryTextField('Category color:'.tr()),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final color = _colorDataSource.elementAt(index);
                final isSelected = colorSelected == color;

                return GestureDetector(
                  onTap: () {
                    // Logic to open color selection dialog or screen
                    setState(() {
                      colorSelected = color;
                    });
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(36 / 2),
                    ),
                    child: isSelected
                        ? Icon(Icons.check, color: Colors.white, size: 20)
                        : null,
                  ),
                );
              },
              itemCount: _colorDataSource.length,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              // backOnPressed.call();
            },
            child: Text(
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
            onPressed: () {
              _handleCreateCategory();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF8687E7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text(
              // onboardingPagePosition == OnboardingPagePosition.page3
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

  Widget _createCategoryTextField(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white.withOpacity(0.87),
        fontSize: 16,
        fontFamily: "Lato",
      ),
    );
  }

  void _handleCreateCategory() {
    final categoryName = _nameTextController.text;
    print(categoryName);

    /// save các thông tin và local data
  }
}
