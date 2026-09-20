class Product {
  final String id;
  final String brand;
  final String title;
  final String description;
  final String price;
  final String originalPrice;
  final String? badge;
  final String image;
  final List<String> sizes;
  final List<String> colors;
  final String material;
  final String care;
  final String category;

  const Product({
    required this.id,
    required this.brand,
    required this.title,
    required this.description,
    required this.price,
    required this.originalPrice,
    this.badge,
    required this.image,
    required this.sizes,
    required this.colors,
    required this.material,
    required this.care,
    required this.category,
  });

  List<String> get availableSizes =>
      sizes.isNotEmpty ? sizes : const ['XS', 'S', 'M', 'L', 'XL'];
  List<String> get availableColors =>
      colors.isNotEmpty ? colors : const ['Classic'];
  String get defaultSize => availableSizes.first;
  String get defaultColor => availableColors.first;

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      brand: map['brand'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'] as String,
      originalPrice: map['originalPrice'] as String,
      badge: map['badge'] as String?,
      image: map['image'] as String,
      sizes: List<String>.from(map['sizes'] as List),
      colors: List<String>.from(map['colors'] as List),
      material: map['material'] as String,
      care: map['care'] as String,
      category: map['category'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'brand': brand,
      'title': title,
      'description': description,
      'price': price,
      'originalPrice': originalPrice,
      'badge': badge,
      'image': image,
      'sizes': sizes,
      'colors': colors,
      'material': material,
      'care': care,
      'category': category,
    };
  }
}