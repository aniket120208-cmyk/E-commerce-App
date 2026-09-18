import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ZorixHomeScreen(),
    ),
  );
}

class ZorixHomeScreen extends StatelessWidget {
  const ZorixHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded, size: 20), label: 'DISCOVER'),
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 20), label: 'EXPLORE'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined, size: 20), label: 'BAG'),
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping_outlined, size: 20), label: 'ORDERS'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 20), label: 'PROFILE'),
        ],
      ),
    );
  }
}