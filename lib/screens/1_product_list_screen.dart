// lib/screens/1_product_list_screen.dart

import 'package:flutter/material.dart';
import '../models/product.dart';
import '2_product_detail_screen.dart';
import '3_shopping_cart_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // Список "товаров"
  final List<Product> _products = [
    Product(name: 'Ноутбук', description: 'Мощный ноутбук для работы и игр', price: 999.99),
    Product(name: 'Смартфон', description: 'Современный смартфон с отличной камерой', price: 699.99),
    Product(name: 'Наушники', description: 'Беспроводные наушники с шумоподавлением', price: 199.99),
    Product(name: 'Клавиатура', description: 'Механическая клавиатура для геймеров', price: 129.99),
  ];

  // Список товаров в корзине (состояние)
  // Это состояние теперь будет передаваться между экранами.
  final List<Product> _shoppingCart = [];

  // Функция для добавления товара в корзину
  void _addToCart(Product product) {
    setState(() {
      _shoppingCart.add(product);
    });
    // Показываем уведомление
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} добавлен в корзину!'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // Функция для очистки корзины после заказа
  void _clearCart() {
    setState(() {
      _shoppingCart.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог товаров'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // Кнопка для перехода в корзину
          IconButton(
            icon: Badge(
              label: Text('${_shoppingCart.length}'),
              isLabelVisible: _shoppingCart.isNotEmpty,
              child: const Icon(Icons.shopping_cart),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoppingCartScreen(
                    cart: _shoppingCart,
                    onClearCart: _clearCart, // Передаем функцию очистки
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            onTap: () {
              // Переход на экран деталей товара
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    product: product,
                    onAddToCart: _addToCart, // Передаем функцию добавления
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
