# Zorix — E-Commerce App

A simple, responsive Flutter e-commerce application for browsing and shopping clothing products. Built with clean separation of concerns, reusable UI components, and intuitive navigation.

## Features

- **Discover:** Home screen featuring curated collections, promotional vouchers, and seasonal offers.
- **Explore:** Search and filter clothing products in real time by title, brand, or description.
- **Product Details:** Detailed product view showcasing available sizes, color options, and fabric/material specifications.
- **Bag (Cart):** Shopping cart with dynamic item quantity management, removal, and subtotal calculation.
- **Orders:** Order history screen to view and track past purchases.
- **Wishlist:** Save and manage favorite clothing items for quick access later.
- **Profile:** User account screen displaying personal details and quick navigation links.

## Project Structure

```text
lib/
├── main.dart                          # App entry point, bottom navigation, and Discover (Home) screen
├── data/
│   └── product_data.dart              # Sample clothing product catalog and mock data
├── models/
│   ├── product_model.dart             # Product data model (title, brand, price, sizes, colors, material)
│   ├── cart_item_model.dart           # Cart item data model (product, selected options, quantity)
│   └── order_model.dart               # Order data model (items, total amount, date, status)
├── screens/
│   ├── explore_screen.dart            # Search and browse products screen
│   ├── product_details_screens.dart   # Product detail view with size, color, and material info
│   ├── cart_screens.dart              # Cart / shopping bag screen
│   ├── orders_screen.dart             # Past orders screen
│   ├── wishlist_screen.dart           # Saved wishlist items screen
│   └── profile_screen.dart            # User profile screen
├── widgets/
│   └── item_card.dart                 # Reusable product card widget
└── utils/
    └── app_nav.dart                   # Bottom navigation state management