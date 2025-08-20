import 'package:flutter/material.dart';
import 'package:reminder_app/views/pages/login_page.dart';
import 'package:reminder_app/views/pages/register_page.dart';
import 'package:reminder_app/views/widgets/hero_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeroWidget(title: 'Welcome Page'),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            FittedBox(
              child: Text(
                'Habit Builder',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  letterSpacing: 4.0,
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegisterPage();
                    },
                  ),
                );
              },
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.teal,
              ),
              child: Text('Get started'),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
