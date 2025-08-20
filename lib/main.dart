import 'package:flutter/material.dart';
import 'package:reminder_app/data/notifiers.dart';
import 'package:reminder_app/views/pages/welcome_page.dart';

void main() {
  runApp(const HabitBuilder());
}

// Material App (Stateful)
// Scaffold
// App title
// Bottom Navigation bar SetState

class HabitBuilder extends StatelessWidget {
  const HabitBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: WelcomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: WelcomePage());
  }
}
