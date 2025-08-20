import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool? isCheckedListTile = false;
  bool isSwitched = false;
  bool isSwitchedListTile = false;
  double sliderValue = 30.0;
  String? menuItem = "el3";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings Page')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextField
              TextField(
                controller: controller,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                onEditingComplete: () {
                  setState(() {});
                },
              ),
              const SizedBox(height: 16),
              // Text
              Text(controller.text),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    focusColor: Colors.black54,
                    value: menuItem,
                    items: [
                      DropdownMenuItem(value: 'el1', child: Text('Duca')),
                      DropdownMenuItem(value: 'el2', child: Text('Muca')),
                      DropdownMenuItem(value: 'el3', child: Text('Rale')),
                      DropdownMenuItem(
                        value: 'el4',
                        child: Text('Food around the corner'),
                      ),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        menuItem = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // CheckBox
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox.adaptive(
                    tristate: true,
                    checkColor: Colors.red,
                    focusColor: Colors.yellow,
                    hoverColor: Colors.teal,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // CheckBoxlistTile
              CheckboxListTile.adaptive(
                title: Text('Hello There. This is CheckBox List Tile'),
                value: isCheckedListTile,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedListTile = value;
                  });
                },
              ),
              // Switch
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Switch.adaptive(
                    value: isSwitched,
                    onChanged: (bool value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Switch List Tile
              SwitchListTile.adaptive(
                title: Text('This is Switch List Tile. Switch me!'),
                value: isSwitchedListTile,
                onChanged: (bool value) {
                  setState(() {
                    isSwitchedListTile = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              // Slider
              Slider.adaptive(
                label: 'This is the label',
                activeColor: Colors.purple,
                inactiveColor: Colors.green,
                thumbColor: Colors.amber,
                max: 100.0,
                divisions: 10,
                value: sliderValue,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  print('Clicked!!!');
                },
                child: Image.asset(
                  'assets/images/logger_habit_tracker.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => print('Clicked the other one!!!'),
                splashColor: Colors.teal,
                onDoubleTap: () => ('Clicked Double Mate!!!'),
                child: Ink.image(
                  image: const AssetImage('assets/images/habit_tracker_2.jpg'),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.black,
                ),
                child: Text('Elevated Button. Click me!'),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {},
                child: Text('Filled Button Click me!'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: Text('Text Button Click me!'),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {},
                child: Text('Outlined Button Click me!'),
              ),
              const SizedBox(height: 16),
              CloseButton(onPressed: () {}),
              const SizedBox(height: 16),
              BackButton(),
            ],
          ),
        ),
      ),
    );
  }
}
