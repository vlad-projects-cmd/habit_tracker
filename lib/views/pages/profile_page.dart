import 'package:flutter/material.dart';
import 'package:reminder_app/data/notifiers.dart';
import 'package:reminder_app/views/pages/welcome_page.dart';
import 'package:reminder_app/views/widgets/hero_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          ListTile(
            title: Text('Log Out!'),
            onTap: () {
              selectedPageNotifier.value = 0;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomePage();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          HeroWidget(title: 'Profile'),
        ],
      ),
    );
  }
}
