import 'package:flutter/material.dart';
import 'package:reminder_app/data/constants.dart';
import 'package:reminder_app/views/pages/register_page.dart';
import 'package:reminder_app/views/widgets/hero_widget.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          HeroWidget(title: 'Welcome Page'),
                          const SizedBox(height: 16),
                          const SizedBox(height: 16),
                          const SizedBox(height: 16),
                          Text(
                            'Welcome to Habit Builder!',
                            style: KTextStyle.descriptionText,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          FilledButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return RegisterPage(title: 'Register');
                                  },
                                ),
                              );
                            },
                            child: Text('Next'),
                          ),
                        ],
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
