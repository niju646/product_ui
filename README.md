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
- ✅ Login & Signup using a backend API (with Dio)
- 🔐 Securely stores auth token, email, and username using `flutter_secure_storage`
- 🏠 Home screen with products (fetched via API)
- 🛒 Add to Cart & Favorite products
- ❤️ Favorites page
- 👤 Profile screen that displays saved user details
- 🔁 Auto-login if token exists (no need to login every time)
- 🚪 Logout functionality
- 🧭 Navigation using `go_router`
- 🌐 API integration using Dio

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
  dio: ^5.4.0
  flutter_secure_storage: ^9.0.0
  provider: ^6.1.0
  go_router: ^13.0.1

## 🖼️ Assets

Add your product images inside the `assets/` directory and register them in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/iphone.jpg
    # Add more images as needed
