import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoly/controller/post_controller.dart';
import 'package:todoly/controller/todo_view_controller.dart';
import 'package:todoly/service/storage/local_storage_service.dart';
import 'package:todoly/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService().initializeHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoViewController()),
        ChangeNotifierProvider(create: (_) => PostController()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.blueGrey,
          ),
          title: 'Todoly',
          home: const HomeView()),
    );
  }
}
