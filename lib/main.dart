import 'app.dart';
import 'package:flutter/material.dart';
import 'core/networking/dio_helper.dart';

void main() {
  DioHelper().init();
  runApp(const App());
}
