import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  Environment._();
  static initEnvironment(String fileEnv) async {
    await dotenv.load(fileName: fileEnv);
  }

  static final String urlWebClient =
      dotenv.env['URL_WEB_CLIENT'] ?? 'Doesnt work url';
  static final String urlProvider =
      dotenv.env['URL_PROVIDER'] ?? 'Doesnt work url';
}
