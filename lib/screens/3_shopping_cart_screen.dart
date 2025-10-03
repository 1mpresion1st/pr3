// lib/screens/3_shopping_cart_screen.dart

import 'package:flutter/material.dart';
import '../models/product.dart';
import '4_checkout_screen.dart';

class ShoppingCartScreen extends StatelessWidget {
  final List<Product> cart;
  final VoidCallback onClearCart; // Функция для очистки корзины

  const ShoppingCartScreen(
      {super.key, required this.cart, required this.onClearCart});

  @override
  Widget build(BuildContext context) {
    // Считаем общую стоимость
    final double total = cart.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text('Ваша корзина пуста.'))
                : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cart[index].name),
                  trailing: Text('\$${cart[index].price.toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          if (cart.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Итого: \$${total.toStringAsFixed(2)}', style: Theme
                      .of(context)
                      .textTheme
                      .headlineSmall),
                  ElevatedButton(
                    onPressed: () {
                      // Переход к оформлению заказа
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CheckoutScreen(onCheckoutComplete: onClearCart),
                        ),
                      );
                    },
                    child: const Text('Оформить заказ'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}