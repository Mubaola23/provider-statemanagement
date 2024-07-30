import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final String text;
  const AppLogo({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          color: Colors.yellow,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 30,
                fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        const Text(
          'ly',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
