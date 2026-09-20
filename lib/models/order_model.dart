import 'package:flutter/foundation.dart';
import 'package:e_commerce_app/models/cart_item_model.dart';

class Order {
  final String id;
  final List<CartItem> items;
  final DateTime placedAt;
  final String status;

  const Order({
    required this.id,
    required this.items,
    required this.placedAt,
    this.status = 'PROCESSING',
  });

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);

  double get total => items.fold(0.0, (sum, item) => sum + item.totalPrice);
}

class OrderManager extends ChangeNotifier {
  static final OrderManager _instance = OrderManager._internal();
  factory OrderManager() => _instance;
  OrderManager._internal();

  final List<Order> _orders = [];
  int _nextId = 0001;

  List<Order> get orders => List.unmodifiable(_orders);

  Order placeOrder(List<CartItem> items) {
    final order = Order(
      id: 'ZX-${_nextId++}',
      placedAt: DateTime.now(),
      items: items
          .map(
            (i) => CartItem(
              product: i.product,
              size: i.size,
              color: i.color,
              quantity: i.quantity,
            ),
          )
          .toList(),
    );
    _orders.insert(0, order);
    notifyListeners();
    return order;
  }
}
