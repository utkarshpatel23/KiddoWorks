import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const KiddoApp());
}

class KiddoApp extends StatelessWidget {
  const KiddoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiddo Works',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(),
    );
  }
}
