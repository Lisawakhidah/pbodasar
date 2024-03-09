import 'package:flutter/material.dart';
import 'package:pertemuan9/SharedActivity.dart';

void main() {
  runApp(SharedApp());
}

class SharedApp extends StatelessWidget {
  const SharedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyek Shared Preferences',
      theme: ThemeData(primarySwatch: Colors.green),
      home: SharedActivity(),
      debugShowCheckedModeBanner: false,
    );
  }
}
