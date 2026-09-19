import 'package:flutter/material.dart';
import 'package:e_commerce_app/data/product_data.dart';
import 'package:e_commerce_app/widgets/item_card.dart';
import 'package:e_commerce_app/screens/product_details_screens.dart';
import 'package:e_commerce_app/screens/cart_screens.dart';
import 'package:e_commerce_app/screens/orders_screen.dart';
import 'package:e_commerce_app/screens/profile_screen.dart';
import 'package:e_commerce_app/utils/app_nav.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainNavScreen(),
    ),
  );
}

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  final List<Widget> _screens = const [
    ZorixHomeScreen(),
    Center(child: Text('Explore')),
    CartScreen(),
    OrdersScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: AppNav.tab,
      builder: (context, currentIndex, _) => Scaffold(
      body: IndexedStack(index: currentIndex, children: _screens),
      bottomNavigationBar: AnimatedBuilder(
        animation: CartManager(),
        builder: (context, _) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) => AppNav.tab.value = index,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            items: [
              const BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded, size: 20), label: 'DISCOVER'),
              const BottomNavigationBarItem(icon: Icon(Icons.search, size: 20), label: 'EXPLORE'),
              BottomNavigationBarItem(
                icon: Badge(
                  label: Text('${CartManager().itemCount}'),
                  isLabelVisible: CartManager().itemCount > 0,
                  child: const Icon(Icons.shopping_bag_outlined, size: 20),
                ),
                label: 'BAG',
              ),
              const BottomNavigationBarItem(icon: Icon(Icons.local_shipping_outlined, size: 20), label: 'ORDERS'),
              const BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 20), label: 'PROFILE'),
            ],
          );
        },
      ),
      ),
    );
  }
}

class ZorixHomeScreen extends StatefulWidget {
  const ZorixHomeScreen({super.key});

  @override
  State<ZorixHomeScreen> createState() => _ZorixHomeScreenState();
}

class _ZorixHomeScreenState extends State<ZorixHomeScreen> {
  int _selectedCategoryIndex = 0;
  int _selectedChipIndex = 0;

  final List<Map<String, dynamic>> _categories = const [
    {'title': 'NEW IN', 'icon': Icons.local_fire_department},
    {'title': 'BESTSELLERS', 'icon': Icons.bolt},
    {'title': 'OUTERWEAR', 'icon': Icons.checkroom},
    {'title': 'TAILORING', 'icon': Icons.military_tech_outlined},
    {'title': 'NEW DROP', 'icon': Icons.accessibility_new},
  ];

  final List<String> _chips = const [
    'All Pieces',
    'Outerwear',
    'Tailored',
    'Knitwear',
    'Accessories',
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> sections = [
      Container(
        width: double.infinity,
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flash_on, color: Colors.white, size: 12),
            SizedBox(width: 4),
            Text(
              'FLASH SALE: EXTRA 20% OFF WITH CODE ZORIX20',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 86,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: _categories.length,
          separatorBuilder: (_, __) => const SizedBox(width: 14),
          itemBuilder: (context, index) {
            final cat = _categories[index];
            final bool active = _selectedCategoryIndex == index;
            return GestureDetector(
              onTap: () => setState(() => _selectedCategoryIndex = index),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: active ? const Color(0xFFBC4B27) : Colors.grey.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: active ? const Color(0xFFBC4B27) : const Color(0xFFEDEAE4),
                      child: Icon(
                        cat['icon'] as IconData,
                        size: 16,
                        color: active ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cat['title'] as String,
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: active ? const Color(0xFFBC4B27) : Colors.black87,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '• NEW ARRIVALS',
                  style: TextStyle(
                    color: Color(0xFFBC4B27),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Text('Spring / Summer 2026', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
            const Text('Sculptural minimalism through untamed Italian craftsmanship.',
                style: TextStyle(color: Colors.black54, fontSize: 12)),
            const SizedBox(height: 12),
            Container(
              height: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=800&q=80'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black87],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'EDITORIAL SPOTLIGHT',
                          style: TextStyle(color: Colors.white70, fontSize: 9, letterSpacing: 1.2),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'The Sculpted Silhouette',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Fluid silk trenches, structured lapels, and hand-stitched worsted wool engineered for effortless movement.',
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                        const SizedBox(height: 14),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                          ),
                          child: const Text('Explore Collection →',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Exclusive App Vouchers', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
            Text('CLICK TO CLAIM', style: TextStyle(color: Colors.grey, fontSize: 9)),
          ],
        ),
      ),
      SizedBox(
        height: 110,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Container(
              width: 250,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('APP FIRST ORDER',
                          style: TextStyle(color: Colors.white70, fontSize: 9, fontWeight: FontWeight.bold)),
                      Text('Expires in 2d', style: TextStyle(color: Colors.white54, fontSize: 8)),
                    ],
                  ),
                  const Text('\$25 OFF',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  const Text('Min. order \$120 on all collections',
                      style: TextStyle(color: Colors.white, fontSize: 9), maxLines: 1),
                  Container(
                    width: double.infinity,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                    child: const Text('CLAIM',
                        style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 250,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: const Color(0xFFBC4B27), borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('VIP EXCLUSIVE',
                          style: TextStyle(color: Colors.white70, fontSize: 9, fontWeight: FontWeight.bold)),
                      Text('Auto applied', style: TextStyle(color: Colors.white54, fontSize: 8)),
                    ],
                  ),
                  const Text('15% EXTRA',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  const Text('Applies automatically to Silk & Cashmere',
                      style: TextStyle(color: Colors.white, fontSize: 9), maxLines: 1),
                  Container(
                    width: double.infinity,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(12)),
                    child: const Text('CLAIM',
                        style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 6),
        child: SizedBox(
          height: 32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _chips.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, i) {
              final isSelected = _selectedChipIndex == i;
              return GestureDetector(
                onTap: () => setState(() => _selectedChipIndex = i),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: isSelected ? Colors.black : Colors.grey.shade300),
                  ),
                  child: Text(
                    _chips[i],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF141414),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('• PRIVATE ZORIX DROP',
                    style: TextStyle(color: Colors.white70, fontSize: 9, fontWeight: FontWeight.bold)),
                Text('LIMITED 150 UNITS', style: TextStyle(color: Colors.white54, fontSize: 8)),
              ],
            ),
            const SizedBox(height: 6),
            const Text('The Tuscan Silk Capsule',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text(
              'Numbered edition of 150 units. Pure raw mulberry silk tailored in Florence.',
              style: TextStyle(color: Colors.white60, fontSize: 10),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                for (final unit in [
                  {'val': '01', 'unit': 'DAYS'},
                  {'val': '14', 'unit': 'HOURS'},
                  {'val': '30', 'unit': 'MINS'}
                ]) ...[
                  Container(
                    width: 50,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(color: const Color(0xFF232323), borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      children: [
                        Text(unit['val']!,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                        Text(unit['unit']!, style: const TextStyle(color: Colors.white54, fontSize: 7)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                ]
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFBC4B27),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text('Claim VIP Reservation',
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.white24), shape: BoxShape.circle),
                  child: IconButton(
                    icon: const Icon(Icons.share_outlined, color: Colors.white, size: 16),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SELECTED FOR YOU',
                  style: TextStyle(color: Color(0xFFBC4B27), fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                SizedBox(height: 2),
                Text('Curated Essentials', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Icon(Icons.tune, size: 14, color: Colors.grey),
                SizedBox(width: 4),
                Text('Filter & Sort', style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          itemCount: clothingProducts.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 18,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, itemIdx) {
            final product = clothingProducts[itemIdx];
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
                onFavoriteTap: () {},
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
      ),
      Container(
        margin: const EdgeInsets.all(16),
        height: 260,
        decoration: BoxDecoration(
          color: const Color(0xFF2C2420),
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1558769132-cb1aea458c5e?w=800&q=80'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('WINTER COLLECTIONS ARE OUT',
                      style: TextStyle(color: Colors.white60, fontSize: 8, letterSpacing: 1.2)),
                  SizedBox(height: 4),
                  Text('Luxury items for luxury people.',
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('The best for your friends and family.',
                      style: TextStyle(color: Colors.white70, fontSize: 10)),
                  SizedBox(height: 10),
                  Text('Explore Collections →',
                      style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        titleSpacing: 16,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text('Z',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ZORIX',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 13, letterSpacing: 1.5)),
                Text('CLOTHING',
                    style: TextStyle(color: Colors.grey, fontSize: 9, letterSpacing: 1.2)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.black, size: 20), onPressed: () {}),
          IconButton(icon: const Icon(Icons.favorite_border, color: Colors.black, size: 20), onPressed: () {}),
          const Padding(
            padding: EdgeInsets.only(right: 16, left: 4),
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Color(0xFFD6A284),
              child: Icon(Icons.person, size: 16, color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) => sections[index],
      ),
    );
  }
}