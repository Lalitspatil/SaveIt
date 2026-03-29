import 'package:saveit/services/api_client.dart';

class Urls {
  static void setBaseURL() {
    bASEURL = 'http://192.168.31.79:3000'; // 👈 Android emulator ke liye
    // bASEURL = 'http://YOUR_IP:3000'; // 👈 real device
  }

  static String get insta => 'download';
}