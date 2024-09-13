import 'package:flutter/material.dart';
import 'package:sample_exam_5/src/config/app_theme.dart';
import 'package:sample_exam_5/src/exam_screen_1.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExamScreen1(),
      themeMode: ThemeMode.dark,
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
