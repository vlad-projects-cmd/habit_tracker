import 'package:flutter/material.dart';
import 'package:reminder_app/data/notifiers.dart';
import 'package:reminder_app/views/pages/history_page.dart';
import 'package:reminder_app/views/pages/home_page.dart';
import 'package:reminder_app/views/pages/profile_page.dart';
import 'package:reminder_app/views/pages/progress_page.dart';
import 'package:reminder_app/views/pages/settings_page.dart';
import 'package:reminder_app/views/pages/test_page.dart';
import 'package:reminder_app/views/widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), HistoryPage(), ProfilePage(), TestPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Builder'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProgressPage(title: 'Progress');
                  },
                ),
              );
            },
            icon: Icon(Icons.track_changes_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage();
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                return Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode);
              },
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      drawer: SafeArea(
        minimum: EdgeInsets.all(50.0),
        child: Drawer(
          child: Column(children: [ListTile(title: Text('Logout'))]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: NavBarWidget(),
    );
  }
}
