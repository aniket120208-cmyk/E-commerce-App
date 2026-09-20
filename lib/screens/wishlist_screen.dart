import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/widgets/item_card.dart';
import 'package:e_commerce_app/screens/cart_screens.dart';
import 'package:e_commerce_app/screens/product_details_screens.dart';

class WishlistManager extends ChangeNotifier {
  static final WishlistManager _instance = WishlistManager._internal();
  factory WishlistManager() => _instance;
  WishlistManager._internal();

  final List<Product> _items = [];
  List<Product> get items => List.unmodifiable(_items);

  bool isFavorite(String productId) =>
      _items.any((product) => product.id == productId);

  void add(Product product) {
    if (!isFavorite(product.id)) {
      _items.add(product);
      notifyListeners();
    }
  }

  void remove(String productId) {
    _items.removeWhere((product) => product.id == productId);
    notifyListeners();
  }

  /// Adds/removes the product and returns true if it was added,
  /// false if it was removed.
  bool toggle(Product product) {
    if (isFavorite(product.id)) {
      remove(product.id);
      return false;
    } else {
      add(product);
      return true;
    }
  }

  int get itemCount => _items.length;

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

void showWishlistSnackBar(BuildContext context, bool added) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(
      SnackBar(
        content: Text(added ? 'Added to wishlist' : 'Removed from wishlist'),
        duration: const Duration(seconds: 1),
      ),
    );
}

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: WishlistManager(),
      builder: (context, _) {
        final items = WishlistManager().items;

        return Scaffold(
          backgroundColor: const Color(0xFFF9F9FB),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            title: const Text(
              'WISHLIST',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: items.isEmpty
              ? const _EmptyWishlist()
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (context, i) {
                    final product = items[i];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(product: product),
                          ),
                        );
                      },
                      child: ProductItemCard(
                        product: product,
                        isFavorite: true,
                        onFavoriteTap: () {
                          WishlistManager().remove(product.id);
                          showWishlistSnackBar(context, false);
                        },
                        onAddTap: () {
                          CartManager().add(
                            product,
                            product.defaultSize,
                            product.defaultColor,
                          );
                          ScaffoldMessenger.of(context)
                            ..clearSnackBars()
                            ..showSnackBar(
                              SnackBar(
                                content: Text('${product.title} added to bag'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                        },
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}

class _EmptyWishlist extends StatelessWidget {
  const _EmptyWishlist();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite_border, size: 48, color: Colors.grey),
          SizedBox(height: 12),
          Text('Your wishlist is empty', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
