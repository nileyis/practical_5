
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:practical_5/cart_provider.dart';
import 'package:practical_5/item.dart';
import 'package:practical_5/cart.dart';

// ==========================================
// MAIN APPLICATION
// ==========================================

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

// ==========================================
// ITEM CATALOG
// ==========================================

final List<Item> catalog = [
  Item(1, 'Shoes'),
  Item(2, 'Hats'),
  Item(3, 'Shirts'),
  Item(4, 'Tie'),
  Item(5, 'Pants'),
  Item(6, 'Jeans'),
  Item(7, 'Shorts'),
  Item(8, 'Underwear'),
  Item(9, 'Jumpers'),
  Item(10, 'Trousers'),
  Item(11, 'Sleepwear'),
  Item(12, 'Accessories'),
];

// ==========================================
// CART ITEM
// ==========================================

class CartItem extends StatelessWidget {
  final int index;

  const CartItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final item = catalog[index];

    return ListTile(
      leading: CircleAvatar(
        child: Text(item.id.toString()),
      ),

      title: Text(item.name),

      trailing: ElevatedButton(
        onPressed: () {
          Provider.of<CartProvider>(
            context,
            listen: false,
          ).add(item);
        },

        child: const Text('Add to Cart'),
      ),
    );
  }
}

// ==========================================
// MY APP
// ==========================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),

      home: const MyHomePage(
        title: 'Shopping Catalog',
      ),
    );
  }
}

// ==========================================
// HOME PAGE
// ==========================================

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
        Theme.of(context).colorScheme.inversePrimary,

        title: Text(title),

        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
          ),
        ],
      ),

      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return CartItem(index: index);
        },

        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },

        itemCount: catalog.length,
      ),
    );
  }
}
