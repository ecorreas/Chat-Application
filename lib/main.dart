import 'dart:io';
import 'package:app/core/providers/app_provider.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';

import 'package:app/app/app_widget.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    await DesktopWindow.setMinWindowSize(Size(1240, 900));
  }
  runApp(MultiProvider(
    providers: AppProvider.listProviders,
    child: AppWidget(),
  ));
}
