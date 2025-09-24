import 'package:flutter/material.dart';
import 'package:reminder_app/views/widgets/hero_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [Center(child: HeroWidget(title: 'History'))],
          ),
        ),
      ),
    );
  }
}
