import 'package:flutter/material.dart';
import 'package:reminder_app/views/widget_tree.dart';
import 'package:reminder_app/views/widgets/hero_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  // ---- Password policy (tweak to your needs) ----
  static const int minLength = 10; // e.g. 10+ chars
  static final _upper = RegExp(r'[A-Z]');
  static final _lower = RegExp(r'[a-z]');
  static final _digit = RegExp(r'\d');
  // Any symbol/punctuation: not a word char (letter/digit/underscore) and not whitespace
  static final _symbol = RegExp(r'[^\w\s]');
  static final _space = RegExp(r'\s');

  // Basic email pattern (keeps it lightweight without extra packages)
  static final _emailPattern = RegExp(
    r'^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}',
    caseSensitive: false,
  );

  @override
  void initState() {
    super.initState();
    _passwordCtrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  bool get _hasMinLen => _passwordCtrl.text.length >= minLength;
  bool get _hasUpper => _upper.hasMatch(_passwordCtrl.text);
  bool get _hasLower => _lower.hasMatch(_passwordCtrl.text);
  bool get _hasDigit => _digit.hasMatch(_passwordCtrl.text);
  bool get _hasSymbol => _symbol.hasMatch(_passwordCtrl.text);
  bool get _hasNoSpaces => !_space.hasMatch(_passwordCtrl.text);

  String? _validateEmail(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return 'Email is required';
    if (!_emailPattern.hasMatch(v)) {
      return 'Please enter a valid email address (e.g. name@example.com)';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final pwd = value ?? '';
    if (pwd.isEmpty) return 'Password is required';

    final missing = <String>[];
    if (!_hasMinLen) missing.add('• at least $minLength characters');
    if (!_hasUpper) missing.add('• an uppercase letter');
    if (!_hasLower) missing.add('• a lowercase letter');
    if (!_hasDigit) missing.add('• a number');
    if (!_hasSymbol) missing.add('• a symbol');
    if (!_hasNoSpaces) missing.add('• no spaces');

    if (missing.isNotEmpty) {
      return 'Password must include:\n${missing.join('\n')}';
    }
    return null;
  }

  String? _validateConfirm(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please retype your password';
    }
    if (value != _passwordCtrl.text) {
      return 'Passwords don\'t match';
    }
    return null;
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    // TODO: Hook into your real register flow (API call / auth provider) here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All good! Creating your account…')),
    );

    // Navigate to WidgetTree after a short delay so the snack shows
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WidgetTree()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
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
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.fromLTRB(
                        20,
                        20,
                        20,
                        20 +
                            MediaQuery.of(
                              context,
                            ).viewInsets.bottom, // room for keyboard
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
                              'Create your account',
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
                            const SizedBox(height: 10),
                            _PasswordChecklist(
                              hasMinLen: _hasMinLen,
                              hasUpper: _hasUpper,
                              hasLower: _hasLower,
                              hasDigit: _hasDigit,
                              hasSymbol: _hasSymbol,
                              hasNoSpaces: _hasNoSpaces,
                              minLength: minLength,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _confirmCtrl,
                              decoration: InputDecoration(
                                labelText: 'Confirm password',
                                prefixIcon: const Icon(
                                  Icons.lock_reset_outlined,
                                ),
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  onPressed: () => setState(
                                    () => _obscureConfirm = !_obscureConfirm,
                                  ),
                                  icon: Icon(
                                    _obscureConfirm
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  tooltip: _obscureConfirm
                                      ? 'Show password'
                                      : 'Hide password',
                                ),
                              ),
                              obscureText: _obscureConfirm,
                              validator: _validateConfirm,
                            ),
                            const SizedBox(height: 24),
                            FilledButton(
                              onPressed: _submit,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                child: Text('Create account'),
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

class _PasswordChecklist extends StatelessWidget {
  const _PasswordChecklist({
    required this.hasMinLen,
    required this.hasUpper,
    required this.hasLower,
    required this.hasDigit,
    required this.hasSymbol,
    required this.hasNoSpaces,
    required this.minLength,
  });

  final bool hasMinLen;
  final bool hasUpper;
  final bool hasLower;
  final bool hasDigit;
  final bool hasSymbol;
  final bool hasNoSpaces;
  final int minLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password must contain:',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        _row('At least $minLength characters', hasMinLen),
        _row('Uppercase letter', hasUpper),
        _row('Lowercase letter', hasLower),
        _row('Number', hasDigit),
        _row('Symbol (e.g. !, @, #, …)', hasSymbol),
        _row('No spaces', hasNoSpaces),
      ],
    );
  }

  Widget _row(String text, bool ok) {
    return Row(
      children: [
        Icon(
          ok ? Icons.check_circle : Icons.radio_button_unchecked,
          size: 16,
          color: ok ? Colors.green : null,
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: ok ? Colors.green[700] : null,
            ),
          ),
        ),
      ],
    );
  }
}
