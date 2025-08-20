import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  final String title;

  const HeroWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: 'hero_welcome',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/images/habit_tracker_2.jpg',
              color: Colors.green,
              colorBlendMode: BlendMode.colorBurn,
            ),
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
