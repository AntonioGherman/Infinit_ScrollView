import 'package:flutter/material.dart';
import 'new_photo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Photo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewPhotoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
