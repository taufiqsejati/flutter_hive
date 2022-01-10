import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'src/app.dart';
import 'src/common/utils/config.dart';
import 'src/common/utils/setup_locator.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2, // number of method calls to be displayed
    errorMethodCount: 8, // number of method calls if stacktrace is provided
    lineLength: 120, // width of the output
    colors: true, // Colorful log messages
    noBoxingByDefault: false,
  ),
);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetit();
  await initDb();

  runApp(const MyApp());
}
