import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/models/cart_item_model.dart';
import 'package:e_commerce_app/models/order_model.dart';
import 'package:e_commerce_app/utils/app_nav.dart';

class CartManager extends ChangeNotifier {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;
  CartManager._internal();

  final List<CartItem> _items = [];
  List<CartItem> get items => List.unmodifiable(_items);

  void add(Product product, String size, String color) {
    final index = _items.indexWhere(
      (item) => item.product.id == product.id && item.size == size && item.color == color,
    );
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product, size: size, color: color));
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void increment(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decrement(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(item);
    }
    notifyListeners();
  }

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => _items.fold(0.0, (sum, item) => sum + (item.totalPrice as num));

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  void _checkout(BuildContext context) {
    final cart = CartManager();
    if (cart.items.isEmpty) return;

    // Move everything from the bag into a new order.
    final order = OrderManager().placeOrder(cart.items);
    cart.clear();

    final navigator = Navigator.of(context);
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.black,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Text('Order #${order.id} placed successfully'),
          duration: const Duration(seconds: 4),
          // Snackbars with an action stay forever by default (Flutter 3.29+).
          persist: false,
          action: SnackBarAction(
            label: 'VIEW ORDER',
            textColor: const Color(0xFFBC4B27),
            onPressed: () {
              // Works whether the bag is a tab or was pushed from a product page.
              navigator.popUntil((route) => route.isFirst);
              AppNav.tab.value = AppNav.orders;
            },
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CartManager(),
      builder: (context, _) {
        final items = CartManager().items;

        return Scaffold(
          backgroundColor: const Color(0xFFF9F9FB),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            title: const Text(
              'MY BAG',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: items.isEmpty
              ? const _EmptyCart()
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, i) => _CartTile(item: items[i]),
                ),
          bottomNavigationBar: items.isEmpty
              ? null
              : SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(top: BorderSide(color: Colors.grey.shade200)),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Total', style: TextStyle(color: Colors.grey, fontSize: 10)),
                            Text(
                              '\$${CartManager().totalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () => _checkout(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                              ),
                              child: const Text('CHECKOUT', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

class _CartTile extends StatelessWidget {
  final CartItem item;
  const _CartTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.product.image.toString(),
              width: 70,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(width: 70, height: 90, color: Colors.grey.shade200),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.product.title.toString(),
                    maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(height: 2),
                Text('Size: ${item.size}  •  ${item.color}',
                    style: const TextStyle(color: Colors.grey, fontSize: 10)),
                const SizedBox(height: 6),
                Text('\$${(item.totalPrice as num).toStringAsFixed(2)}',
                    style: const TextStyle(color: Color(0xFFBC4B27), fontWeight: FontWeight.w800, fontSize: 13)),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.delete_outline, size: 18, color: Color.fromARGB(255, 215, 77, 67)),
                onPressed: () => CartManager().removeItem(item),
              ),
              Row(
                children: [
                  _qtyBtn(Icons.remove, () => CartManager().decrement(item)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text('${item.quantity}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  _qtyBtn(Icons.add, () => CartManager().increment(item)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _qtyBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey.shade300)),
        child: Icon(icon, size: 12),
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shopping_bag_outlined, size: 48, color: Colors.grey),
          SizedBox(height: 12),
          Text('Your bag is empty', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}