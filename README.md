Zorix - E-Commerce App

A simple Flutter e-commerce app for browsing and shopping clothing products.

Features
Discover - Home screen with featured collections, vouchers, and offers
Explore - Search products by title, brand, or description
Bag - Cart with quantity management
Orders - View past orders
Wishlist - Save favorite products
Profile - User profile screen
Product details with size, color, and material info
Project Structure
lib/
  main.dart                 # App entry point, bottom navigation, home screen
  data/
    product_data.dart       # Sample product catalog
  models/
    product_model.dart      # Product data model
    cart_item_model.dart    # Cart item data model
    order_model.dart        # Order data model
  screens/
    explore_screen.dart     # Search and browse products
    cart_screens.dart       # Cart / bag screen
    orders_screen.dart      # Orders screen
    profile_screen.dart     # Profile screen
    wishlist_screen.dart    # Wishlist screen
    product_details_screens.dart  # Product detail view
  widgets/
    item_card.dart          # Reusable product card
  utils/
    app_nav.dart             # Bottom navigation state
