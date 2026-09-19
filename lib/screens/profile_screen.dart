import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/order_model.dart';
import 'package:e_commerce_app/utils/app_nav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String _name = 'Aniket Tiwari';
  static const String _email = 'aniket120208@gmail.com';
  static const String _phone = '+91 9101572842';
  static const int _wishlist = 0;
  static const int _points = 0;

  void _demoTap(BuildContext context, String label) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text('$label'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.black,
          duration: const Duration(seconds: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        title: const Text(
          'PROFILE',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _header(),
          const SizedBox(height: 16),
          _stats(),
          const SizedBox(height: 20),
          _sectionLabel('ACCOUNT'),
          _menuCard([
            _MenuItem(Icons.local_shipping_outlined, 'My Orders', () => AppNav.tab.value = AppNav.orders),
            _MenuItem(Icons.favorite_border, 'Wishlist', () => _demoTap(context, 'Wishlist')),
          ]),
          const SizedBox(height: 12),
          const Center(
            child: Text('ZORIX  •  CLOTHING', style: TextStyle(color: Colors.grey, fontSize: 10)),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xFFBC4B27),
            child: Text(
              'AT',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(_name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                const SizedBox(height: 3),
                const Text(_email, style: TextStyle(color: Colors.grey, fontSize: 11)),
                const SizedBox(height: 2),
                const Text(_phone, style: TextStyle(color: Colors.grey, fontSize: 11)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'ZORIX GOLD MEMBER',
                    style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stats() {
    return AnimatedBuilder(
      animation: OrderManager(),
      builder: (context, _) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              _stat('${OrderManager().orders.length}', 'ORDERS'),
              _divider(),
              _stat('$_wishlist', 'WISHLIST'),
              _divider(),
              _stat('$_points', 'POINTS'),
            ],
          ),
        );
      },
    );
  }

  Widget _divider() => Container(width: 1, height: 28, color: Colors.grey.shade200);

  Widget _stat(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 9, letterSpacing: 0.8, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: 1, color: Colors.black54),
      ),
    );
  }

  Widget _menuCard(List<_MenuItem> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            ListTile(
              dense: true,
              leading: Icon(items[i].icon, size: 20, color: Colors.black87),
              title: Text(items[i].title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (items[i].trailingText != null)
                    Text(items[i].trailingText!, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                  const SizedBox(width: 4),
                  const Icon(Icons.chevron_right, size: 18, color: Colors.grey),
                ],
              ),
              onTap: items[i].onTap,
            ),
            if (i != items.length - 1) Divider(height: 1, indent: 52, color: Colors.grey.shade200),
          ],
        ],
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final String? trailingText;

  const _MenuItem(this.icon, this.title, this.onTap, {this.trailingText});
}
