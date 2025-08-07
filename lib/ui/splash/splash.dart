import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ytb/ui/onboarding/onboarding_page_view.dart';
import 'package:ytb/ui/welcome/welcome_page.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  Future<void> _checkAppState(BuildContext context) async {
    // Kiểm tra xem có kOnboardingCompleted
    final _isCompleted = await _isOnboardingCompleted();
    if (_isCompleted) {
      if (!context.mounted) {
        return;
      }
      // chuyển đến welcome
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomePage(
            isFirstTimeInstallApp: false,
          ),
        ),
      );
    } else {
      if (!context.mounted) {
        return;
      }
      // Nếu chưa hoàn thành onboarding, chuyển đến trang onboarding
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPageView()),
        // return OnboardingPageView();
        // Chưa có trang onboarding, chuyển đến welcome
      );
    }
  }

  Future<bool> _isOnboardingCompleted() async {
    // Kiểm tra xem người dùng đã hoàn thành onboarding hay chưa
    // Trả về true nếu đã hoàn thành, false nếu chưa
    try {
      // Kiểm tra trạng thái onboarding
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final result = prefs.getBool('kOnboardingCompleted');
      return result ?? false;
    } catch (e) {
      // Xử lý lỗi nếu có
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkAppState(context);
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(child: _buildBodyPage()),
    );
  }

  Widget _buildBodyPage() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildIconSplash(), _buildTextSplash()],
      ),
    );
  }

  Widget _buildIconSplash() {
    return Image.asset(
      'assets/images/splash_icon.png',
      width: 95,
      height: 80,
      fit: BoxFit.cover,
    );
  }

  Widget _buildTextSplash() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: const Text(
        'UpTodo',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
