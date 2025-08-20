// ValueNotifier hold the data
// ValueListenableBuilder listen to the data (don't need the setState)

import 'package:flutter/material.dart';

ValueNotifier selectedPageNotifier = ValueNotifier(0);
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(true);
