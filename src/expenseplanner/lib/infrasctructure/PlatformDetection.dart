import 'dart:io';

import 'package:flutter/foundation.dart';

class PlatformDetection {
  static int getPlatform() {
    if (kIsWeb) {
      return Platforms.Web;
    } else if (Platform.isAndroid) {
      return Platforms.Android;
    } else if (Platform.isIOS) {
      return Platforms.IOS;
    } else if (Platform.isWindows) {
      return Platforms.Windows;
    } else if (Platform.isLinux) {
      return Platforms.Linux;
    } else if (Platform.isMacOS) {
      return Platforms.MacOS;
    } else if (Platform.isFuchsia) {
      return Platforms.Fuchisa;
    }
    return 0;
  }
}

class Platforms {
  static const int Android = 1;
  static const int IOS = 2;
  static const int Web = 3;
  static const int Windows = 4;
  static const int MacOS = 5;
  static const int Linux = 6;
  static const int Fuchisa = 7;
}
