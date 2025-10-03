import 'package:flutter/material.dart';
import '5_order_confirmation_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final VoidCallback onCheckoutComplete;

  const CheckoutScreen({super.key, required this.onCheckoutComplete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Оформление заказа'),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: 'Ваше имя')),
            const SizedBox(height: 10),
            const TextField(
                decoration: InputDecoration(labelText: 'Адрес доставки')),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Вызываем колбэк для очистки корзины
                  onCheckoutComplete();

                  // Переход на экран подтверждения с удалением всех предыдущих экранов в стеке
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderConfirmationScreen()),
                        (Route<dynamic> route) =>
                    route
                        .isFirst, // Оставляем только первый экран (ProductListScreen)
                  );
                },
                child: const Text('Подтвердить заказ'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}