import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/data/product_data.dart';
import 'package:e_commerce_app/widgets/item_card.dart';
import 'package:e_commerce_app/screens/cart_screens.dart';
import 'package:e_commerce_app/screens/wishlist_screen.dart';
import 'package:e_commerce_app/screens/product_details_screens.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Product> get _results {
    if (_query.trim().isEmpty) return clothingProducts;
    final q = _query.toLowerCase();
    return clothingProducts.where((product) {
      return product.title.toLowerCase().contains(q) ||
          product.brand.toLowerCase().contains(q) ||
          product.description.toLowerCase().contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final results = _results;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        titleSpacing: 12,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F5),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE5E5EA)),
          ),
          child: TextField(
            controller: _searchController,
            autofocus: true,
            onChanged: (value) => setState(() => _query = value),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: 'Search products',
              isDense: true,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
              prefixIcon: const Icon(Icons.search, size: 18, color: Colors.grey),
              prefixIconConstraints: const BoxConstraints(minWidth: 36),
              suffixIcon: _query.isEmpty
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.close, size: 18, color: Colors.grey),
                      onPressed: () {
                        _searchController.clear();
                        setState(() => _query = '');
                      },
                    ),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 13),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: AnimatedBuilder(
        animation: WishlistManager(),
        builder: (context, _) {
          if (results.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search_off, size: 48, color: Colors.grey),
                  SizedBox(height: 12),
                  Text('No products found', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
                ],
              ),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: results.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, i) {
              final product = results[i];
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
                  isFavorite: WishlistManager().isFavorite(product.id),
                  onFavoriteTap: () {
                    final added = WishlistManager().toggle(product);
                    showWishlistSnackBar(context, added);
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
          );
        },
      ),
    );
  }
}
