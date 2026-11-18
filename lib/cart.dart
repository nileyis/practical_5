
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:practical_5/cart_provider.dart';
import 'package:practical_5/item.dart';

// ==========================================
// CART PAGE
// ==========================================

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),

      body: const CartListWidget(),
    );
  }
}

// ==========================================
// CART LIST WIDGET
// ==========================================

class CartListWidget extends StatelessWidget {
  const CartListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        return cart.itemList.isNotEmpty
            ? ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final item = cart.itemList[index];

            return CartItem(item: item);
          },

          separatorBuilder:
              (BuildContext context, int index) {
            return const Divider();
          },

          itemCount: cart.itemList.length,
        )
            : const Center(
          child: Text('Cart is empty'),
        );
      },
    );
  }
}

// ==========================================
// CART ITEM
// ==========================================

class CartItem extends StatelessWidget {
  final Item item;

  const CartItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(item.name),

        const Expanded(
          child: SizedBox(),
        ),

        TextButton(
          onPressed: () {
            Provider.of<CartProvider>(
              context,
              listen: false,
            ).remove(item);
          },

          child: const Text('Remove'),
        ),
      ],
    );
  }
}
