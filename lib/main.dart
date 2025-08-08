import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ytb/ui/category/create_or_edit_category.dart';
import 'package:ytb/services/hive_service.dart';
import 'package:ytb/ui/main/main_page.dart';
//import 'package:ytb/ui/splash/splash.dart';
//import 'ui/onboarding/onboarding_page_view.dart';
//import 'package:ytb/ui/welcome/welcome_page.dart';
//import 'package:ytb/data/isar_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //
  await EasyLocalization.ensureInitialized();

  // Initialize Hive instead of Isar
  await HiveService.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'), // English
        Locale('vi'), // Vietnamese
      ],
      path: 'assets/translations', // Đường dẫn đến thư mục chứa file dịch
      fallbackLocale: const Locale('vi'), // Ngôn ngữ mặc định
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF6200EE)),
        useMaterial3: true,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      home: const MainPage(),
    );
  }
}
