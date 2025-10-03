import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final Function(Product) onAddToCart;

  const ProductDetailScreen({super.key, required this.product, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.description, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            Text('Цена: \$${product.price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.headlineSmall),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  onAddToCart(product); // Вызываем функцию добавления в корзину
                  Navigator.pop(context); // Возвращаемся на предыдущий экран
                },
                child: const Text('Добавить в корзину'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
