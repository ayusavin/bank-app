import 'package:flutter/material.dart';

class SlimData {
  final String title;
  final String description;
  final Image icon;
  final Function onClick;

  SlimData(this.title, this.description, this.icon, this.onClick);
}