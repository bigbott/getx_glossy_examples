//import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

String getAssetsPrefix() {
  if (kIsWeb) {
    return '';
  }
  return 'assets/';
}
