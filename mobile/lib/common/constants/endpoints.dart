import 'package:flutter_template/flavors.dart';

abstract class Endpoints {
  static String apiUrl = '${AppFlavor.apiBaseUrl}/api';

  static String login = '$apiUrl/auth/patient';
  static String userInfo = '$apiUrl/auth/me';
}
