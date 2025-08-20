import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool? isCheckedListTile = false;
  bool isSwitched = false;
  bool isSwitchedListTile = false;
  double sliderValue = 30.0;
  String? menuItem = "el3";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            Divider(color: Colors.teal, thickness: 1.0, endIndent: 200.0),
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
            Container(
              height: 50.0,
              child: VerticalDivider(color: Colors.teal, thickness: 15.0),
            ),
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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        CloseButton(),
                        FilledButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close!'),
                        ),
                      ],
                      title: Text('Alert Dialog!'),
                      content: Text('Alert Content!'),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.black,
              ),
              child: Text('Alert!'),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('SnackBar'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: Text('Open Snackbar!'),
            ),
            const SizedBox(height: 16),
            TextButton(onPressed: () {}, child: Text('Text Button Click me!')),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AboutDialog(children: [Text('Dialog')]);
                  },
                );
              },
              child: Text('Open Dialog!'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
