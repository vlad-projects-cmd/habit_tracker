import 'package:flutter/material.dart';
import 'package:reminder_app/views/widget_tree.dart';
import 'package:reminder_app/views/widgets/hero_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscurePassword = true;

  // Basic email pattern
  static final _emailPattern = RegExp(
    r'^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}',
    caseSensitive: false,
  );

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return 'Email is required';
    if (!_emailPattern.hasMatch(v)) {
      return 'Please enter a valid email address (e.g. name@example.com)';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    // Here you would typically handle the login logic
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const WidgetTree()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(
                        20,
                        20,
                        20,
                        20 + MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            HeroWidget(title: widget.title),
                            const Text(
                              'Welcome back',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _emailCtrl,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                hintText: 'name@example.com',
                                prefixIcon: Icon(Icons.email_outlined),
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              autofillHints: const [AutofillHints.email],
                              validator: _validateEmail,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _passwordCtrl,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock_outline),
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  onPressed: () => setState(
                                    () => _obscurePassword = !_obscurePassword,
                                  ),
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  tooltip: _obscurePassword
                                      ? 'Show password'
                                      : 'Hide password',
                                ),
                              ),
                              obscureText: _obscurePassword,
                              validator: _validatePassword,
                            ),
                            const SizedBox(height: 24),
                            FilledButton(
                              onPressed: _submit,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                child: Text('Login'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
