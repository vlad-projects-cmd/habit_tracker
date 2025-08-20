import 'package:flutter/material.dart';
import 'package:reminder_app/views/widget_tree.dart';
import 'package:reminder_app/views/widgets/hero_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            HeroWidget(title: 'Login'),
            const SizedBox(height: 16),
            Divider(color: Colors.black54, height: 1.0),
            const SizedBox(height: 16),
            TextField(
              controller: controllerEmail,
              style: TextStyle(color: Colors.blue),
              decoration: InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              onEditingComplete: () {
                setState(() {});
              },
            ),
            Divider(color: Colors.black54, height: 1.0),
            const SizedBox(height: 16),
            TextField(
              controller: controllerPassword,
              style: TextStyle(color: Colors.blue),
              decoration: InputDecoration(
                hintText: 'Enter your password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              onEditingComplete: () {
                setState(() {});
              },
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                onLoginButtonPressed();
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

  void onLoginButtonPressed() {
    if (controllerEmail.text.isEmpty || controllerPassword.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
      return;
    }

    // Here you would typically handle the login logic, such as calling an API.
    // For now, we will just navigate to the WidgetTree.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WidgetTree()),
    );
  }
}
