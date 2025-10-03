// lib/main.dart

import 'package:flutter/material.dart';
import 'screens/1_product_list_screen.dart'; // Импортируем только главный экран

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Магазин',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // Устанавливаем ProductListScreen как главный (домашний) экран
      home: const ProductListScreen(),
    );
  }
}
