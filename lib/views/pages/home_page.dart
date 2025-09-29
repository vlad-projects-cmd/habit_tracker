import 'package:flutter/material.dart';
import 'package:reminder_app/views/widgets/containers_widget.dart';
import 'package:reminder_app/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeroWidget(title: 'Home'),
              Column(
                children: List.generate(5, (index) {
                  return ContainersWidget(
                    title: 'Title $index',
                    description: 'Description for item $index',
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
