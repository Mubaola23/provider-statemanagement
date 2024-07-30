/// Since Dart is single threaded, isolates are used to achieve concurrency.
/// An isolate is an independent job that has its own memory and runs in parallel with other isolates.
/// Isolates are used to perform heavy computations, run code in parallel, and avoid blocking the main thread.
///  They are used to perform tasks that require heavy computations, such as image processing, file I/O, and network requests.
///
///
///to run the code belopw: dart run lib/views/isolates.dart
library;

import 'dart:isolate';

import 'package:flutter/foundation.dart';

void main() async {
  final receivePort = ReceivePort();
  await Isolate.spawn(cpuIntensiveTask, receivePort.sendPort);

  // Receive messages from the isolate
  final result = await receivePort.first;
  if (kDebugMode) {
    print('Result: $result');
  }
}

void cpuIntensiveTask(SendPort sendPort) {
  // Perform a CPU-intensive task
  int result = 0;
  for (int i = 0; i < 1000000000; i++) {
    result += i;
  }
  // Send the result back to the main isolate
  sendPort.send(result);
}
