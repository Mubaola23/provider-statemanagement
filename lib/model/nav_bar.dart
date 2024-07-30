import 'package:flutter/material.dart';

class NavBar {
  final String title;
  final IconData icon;
  final Widget page;

  const NavBar({
    required this.title,
    required this.icon,
    required this.page,
  });
}
