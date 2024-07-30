import 'package:flutter/material.dart';

class NetworkLoader extends StatelessWidget {
  const NetworkLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
