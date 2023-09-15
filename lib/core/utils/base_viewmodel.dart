import 'package:flutter/material.dart';

abstract class BaseViewModel {
  void start(BuildContext context);
  void dispose();
}
