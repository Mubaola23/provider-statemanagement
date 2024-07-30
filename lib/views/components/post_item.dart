import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const PostItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: ListTile(
        title: Text(
          title.characters.first.toUpperCase() + title.substring(1),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          subtitle.characters.first.toUpperCase() + subtitle.substring(1),
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
