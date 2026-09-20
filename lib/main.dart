import 'package:flutter/material.dart';
import 'package:e_commerce_app/data/product_data.dart';
import 'package:e_commerce_app/widgets/item_card.dart';
import 'package:e_commerce_app/screens/product_details_screens.dart';
import 'package:e_commerce_app/screens/cart_screens.dart';
import 'package:e_commerce_app/screens/orders_screen.dart';
import 'package:e_commerce_app/screens/profile_screen.dart';
import 'package:e_commerce_app/screens/wishlist_screen.dart';
import 'package:e_commerce_app/screens/explore_screen.dart';
import 'package:e_commerce_app/utils/app_nav.dart';
import 'dart:async';
import 'package:flutter/services.dart';

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
    ExploreScreen(),
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
  int _selectedChipIndex = 0;

  final List<String> _chips = const [
    'All Pieces',
    'Outerwear',
    'Tailored',
    'Knitwear',
    'Accessories',
  ];

  void _showClaimedSnackBar(String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
        ),
      );
  }

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
                          onPressed: () => AppNav.tab.value = AppNav.explore,
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
                  GestureDetector(
                    onTap: () => _showClaimedSnackBar('Your \$25 OFF offer is claimed!'),
                    child: Container(
                      width: double.infinity,
                      height: 24,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                      child: const Text('CLAIM',
                          style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)),
                    ),
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
                  GestureDetector(
                    onTap: () => _showClaimedSnackBar('Your 15% EXTRA offer is claimed!'),
                    child: Container(
                      width: double.infinity,
                      height: 24,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(12)),
                      child: const Text('CLAIM',
                          style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                    ),
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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('• PRIVATE ZORIX DROP',
                    style: TextStyle(color: Colors.white70, fontSize: 9, fontWeight: FontWeight.bold)),
                Text('LIMITED 150 UNITS', style: TextStyle(color: Colors.white54, fontSize: 8)),
              ],
            ),
            SizedBox(height: 6),
            Text('The Tuscan Silk Capsule',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(
              'Numbered edition of 150 units. Pure raw mulberry silk tailored in Florence.',
              style: TextStyle(color: Colors.white60, fontSize: 10),
            ),
            SizedBox(height: 12),
            VipCountdownCard(),
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
              child: AnimatedBuilder(
                animation: WishlistManager(),
                builder: (context, _) => ProductItemCard(
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
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'WINTER COLLECTIONS ARE OUT',
                      style: TextStyle(color: Colors.white60, fontSize: 8, letterSpacing: 1.2),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Luxury items for luxury people.',
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'The best for your friends and family.',
                      style: TextStyle(color: Colors.white70, fontSize: 10),
                    ),
                    const SizedBox(height: 6),
                    TextButton(
                      onPressed: () => AppNav.tab.value = AppNav.explore,
                      style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                        'Explore Collections →',
                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
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
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black, size: 20),
            onPressed: () => AppNav.tab.value = AppNav.explore,
          ),
          AnimatedBuilder(
            animation: WishlistManager(),
            builder: (context, _) => IconButton(
              icon: Badge(
                label: Text('${WishlistManager().itemCount}'),
                isLabelVisible: WishlistManager().itemCount > 0,
                child: const Icon(Icons.favorite_border, color: Colors.black, size: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WishlistScreen()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 4),
            child: GestureDetector(
              onTap: () => AppNav.tab.value = AppNav.profile,
              child: const CircleAvatar(
                radius: 13,
                backgroundColor: Color(0xFFD6A284),
                child: Icon(Icons.person, size: 16, color: Colors.white),
              ),
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

class VipCountdownCard extends StatefulWidget {
  const VipCountdownCard({super.key});

  @override
  State<VipCountdownCard> createState() => _VipCountdownCardState();
}

class _VipCountdownCardState extends State<VipCountdownCard> {
  Timer? _timer;
  Duration _remainingTime = const Duration(days: 1, hours: 14, minutes: 30);
  final String _couponCode = 'VIP2026';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds > 0) {
        setState(() {
          _remainingTime = _remainingTime - const Duration(seconds: 1);
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _showCouponDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.stars_rounded, color: Color(0xFFBC4B27)),
            SizedBox(width: 8),
            Text(
              'VIP Offer Unlocked',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Use this coupon code at checkout to claim your VIP reservation discount:',
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2C),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFBC4B27).withValues(alpha: 0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _couponCode,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy_rounded, color: Colors.white70, size: 20),
                    tooltip: 'Copy Code',
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: _couponCode));
                      ScaffoldMessenger.of(dialogContext).showSnackBar(
                        const SnackBar(
                          content: Text('Coupon code copied to clipboard!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Close', style: TextStyle(color: Colors.white54)),
          ),
          ElevatedButton(
            onPressed: () {
              final messenger = ScaffoldMessenger.of(dialogContext);
              Navigator.of(dialogContext).pop();
              messenger
                ..clearSnackBars()
                ..showSnackBar(
                  const SnackBar(
                    content: Text('Your VIP offer is claimed!'),
                    duration: Duration(seconds: 2),
                  ),
                );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFBC4B27),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Apply Now'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final days = _remainingTime.inDays.toString().padLeft(2, '0');
    final hours = (_remainingTime.inHours % 24).toString().padLeft(2, '0');
    final mins = (_remainingTime.inMinutes % 60).toString().padLeft(2, '0');
    final secs = (_remainingTime.inSeconds % 60).toString().padLeft(2, '0');

    final timeUnits = [
      {'val': days, 'unit': 'DAYS'},
      {'val': hours, 'unit': 'HOURS'},
      {'val': mins, 'unit': 'MINS'},
      {'val': secs, 'unit': 'SECS'},
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < timeUnits.length; i++) ...[
              Container(
                width: 50,
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF232323),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    Text(
                      timeUnits[i]['val']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      timeUnits[i]['unit']!,
                      style: const TextStyle(color: Colors.white54, fontSize: 7),
                    ),
                  ],
                ),
              ),
              if (i < timeUnits.length - 1) const SizedBox(width: 8),
            ],
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: _showCouponDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBC4B27),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Claim VIP Reservation',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}