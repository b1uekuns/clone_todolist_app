import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //quản lý các trang chính của ứng dụng
  List<Widget> _pages = [];
  int _currentPage = 0;

  @override
  void initState() {
    // khởi tạo các trang chính
    super.initState();

    _pages = [
      // Replace with your actual page widgets
      Container(color: Colors.red), // Example page 1
      Container(color: Colors.green), // Example page 2
      Container(color: Colors.blue), // Example page 3
      Container(color: Colors.yellow), // Example page 4
      Container(color: Colors.purple), // Example page 5
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: _pages.elementAt(_currentPage),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF363636),
        unselectedItemColor: Colors.white, // màu sắc của item không được chọn
        selectedItemColor: const Color(
          0xFF8687E7,
        ), // màu sắc của item được chọn
        type: BottomNavigationBarType.fixed, // kiểu thanh điều hướng
        currentIndex: _currentPage, // chỉ mục của trang hiện tại
        onTap: (index) {
          if (index == 2) {
            // Logic for the floating action button page
            return;
          }
          setState(() {
            _currentPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home_icons.png',
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            ),
            // khi active sẽ có màu sắc khác
            activeIcon: Image.asset(
              'assets/images/home_icons.png',
              width: 24,
              height: 24,
              fit: BoxFit.fill,
              color: const Color(0xFF8687E7),
            ),
            label: 'Index',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/calendar_icon.png',
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            ),
            activeIcon: Image.asset(
              'assets/images/calendar_icon.png',
              width: 24,
              height: 24,
              fit: BoxFit.fill,
              color: const Color(0xFF8687E7),
            ),
            label: 'Calendar',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Container(),
            label: '',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/clock_icon.png',
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            ),
            activeIcon: Image.asset(
              'assets/images/clock_icon.png',
              width: 24,
              height: 24,
              fit: BoxFit.fill,
              color: const Color(0xFF8687E7),
            ),
            label: 'Focus',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/user_icon.png',
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            ),
            activeIcon: Image.asset(
              'assets/images/user_icon.png',
              width: 24,
              height: 24,
              fit: BoxFit.fill,
              color: const Color(0xFF8687E7),
            ),
            label: 'Profile',
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFF8687E7),
          borderRadius: BorderRadius.circular(32),
        ),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add, size: 30, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
