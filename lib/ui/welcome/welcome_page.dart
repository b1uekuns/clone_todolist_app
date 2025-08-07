import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final bool isFirstTimeInstallApp;

  const WelcomePage({super.key, required this.isFirstTimeInstallApp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: isFirstTimeInstallApp
            ? IconButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    // Nếu có trang trước đó, quay lại
                    Navigator.pop(context);
                  } else {
                    // Nếu không có trang trước đó, có thể đóng ứng dụng hoặc làm gì đó khác
                    print('Không có trang trước để quay lại');
                  }
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 18,
                  color: Colors.white,
                ),
              )
            : null,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeText(),
            const Spacer(),
            _buildButtonChangeLanguage(context),
            _buildLoginButton(),
            _buildCreateAccountButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'welcome'.tr(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'welcome_description'.tr(),
              style: TextStyle(
                color: Colors.white.withOpacity(0.67),
                fontSize: 16,
                fontFamily: 'Lato',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonChangeLanguage(BuildContext context) {
    return Container(
      width: double.infinity, // width không bị giới hạn
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 24), //cách 2 bên màn hình
      margin: EdgeInsets.only(bottom: 24), // khoảng cách trên và dưới
      child: ElevatedButton(
        onPressed: () {
          // Logic to navigate to login page
          final locale = context.locale.toString();
          if (locale == 'en') {
            context.setLocale(Locale('vi'));
          } else {
            context.setLocale(Locale('en'));
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 136, 117, 255),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: const Text(
          'CHANGE LANGUAGE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: "Lato",
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: double.infinity, // width không bị giới hạn
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 24), //cách 2 bên màn hình
      child: ElevatedButton(
        onPressed: () {
          // Logic to navigate to login page
          print('Đi đến trang đăng nhập');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 136, 117, 255),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: "Lato",
          ),
        ),
      ),
    );
  }

  Widget _buildCreateAccountButton() {
    return Container(
      width: double.infinity, // width không bị giới hạn
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.symmetric(
        vertical: 24,
      ), // khoảng cách trên và dưới
      child: ElevatedButton(
        onPressed: () {
          // Logic to navigate to registration page
          print('Đi đến trang đăng ký');
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: const BorderSide(width: 1, color: Color(0xFF8875FF)),
        ),
        child: const Text(
          'CREATE ACCOUNT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: "Lato",
          ),
        ),
      ),
    );
  }
}
