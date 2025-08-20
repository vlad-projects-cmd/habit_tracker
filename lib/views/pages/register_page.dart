import 'package:flutter/material.dart';
import 'package:reminder_app/views/widget_tree.dart';
import 'package:reminder_app/views/widgets/hero_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerRepeatPassword = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerRepeatPassword.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            HeroWidget(title: 'Register'),
            const SizedBox(height: 16),
            Divider(color: Colors.black54, height: 1.0),
            const SizedBox(height: 16),
            TextField(
              controller: controllerEmail,
              style: TextStyle(color: Colors.blue),
              decoration: InputDecoration(
                hintText: 'Enter your email for registration',
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
            Divider(color: Colors.black54, height: 1.0),
            const SizedBox(height: 16),
            TextField(
              controller: controllerRepeatPassword,
              style: TextStyle(color: Colors.blue),
              decoration: InputDecoration(
                hintText: 'Repeat password',
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
                onRegisterButtonPressed();
              },
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  void onRegisterButtonPressed() {
    if (controllerEmail.text.isEmpty ||
        controllerPassword.text.isEmpty ||
        controllerRepeatPassword.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WidgetTree();
        },
      ),
    );
  }
}
