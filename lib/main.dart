import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'app/my_app.dart';
import 'config/app_config/config_constants.dart';
import 'config/app_config/environment.dart';
import 'dependency_injection.dart' as di;
import 'generated/translations.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environment.initEnvironment(ConfigConstants.envProduction);
  LocaleSettings.useDeviceLocale();
  Intl.defaultLocale = LocaleSettings.currentLocale.languageCode;
  debugPrint(LocaleSettings.currentLocale.languageCode);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  di.init();

  runApp(MyApp());
}
