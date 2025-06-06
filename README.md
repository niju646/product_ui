# 🛍️ Flutter Product UI

This is a simple Flutter application that displays a grid of product cards. When a product card is tapped, it navigates to a detail screen showing the selected product's image, name, price, and description.

## ✨ Features

- Grid layout of product cards
- Clickable cards using `GestureDetector`
- Navigation to detailed product page
- Image display with rounded corners
- Shadow effects on product cards
- “Add to cart” button (static placeholder)
- Responsive and clean UI

## 🖼️ Screens

### Home Screen:
- Shows a grid of product cards with image, name, and price.
- Each card has a favorite icon and "Add to cart" button.

### Product Details Screen:
- Displays full product image
- Product name, price, and description
- Back button to return to home screen

## 📁 Project Structure
lib/
│
├── main.dart # Entry point
├── models/
│ └── product.dart # Product model class
│ └── my_product.dart # List of sample products
├── screens/
│ └── home.dart # Home screen with grid view
│ └── product_details.dart # Product details screen
├── widgets/
│ └── product_card.dart # UI for each product card

## 📦 Dependencies

- Flutter SDK
- Material & Cupertino icons

## 🖼️ Assets

Add your product images inside the `assets/` directory and register them in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/iphone.jpg
    # Add more images as needed
