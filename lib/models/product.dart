class Product {
  final String id;
  final String name;
  final String category;
  final String image;
  final String description;
  final double price;

  Product({
    required this.id,
    required this.name,
    this.category = 'Smartphone',
    required this.image,
    this.description = 'A great smartphone for your needs.',
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null || json['name'] == null || json['price'] == null) {
      throw const FormatException(
          'Missing required fields in JSON: id, name, or price');
    }
    String imagePath = _getImagePath(json['name']);
    return Product(
      id: json['id'].toString(),
      name: json['name'],
      price: double.parse(json['price'].toString()),
      image: imagePath,
      category: json['category'] ?? 'Smartphone',
      description: json['description'] ?? 'A great smartphone',
    );
  }

  static String _getImagePath(String name) {
    final imageMap = {
      'iphone': 'assets/iphone.jpg',
      'oppo': 'assets/oppo.jpg',
      'pixel': 'assets/pixel.jpg',
      'realme': 'assets/realme.jpg',
      'redmi': 'assets/redmi.jpg',
      'samsung': 'assets/samsung.jpg',
    };
    String? imagePath = imageMap[name.toLowerCase()];
    if (imagePath == null) {
      return 'assets/default.jpg';
    }
    return imagePath;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'image': image,
      'description': description,
      'price': price,
    };
  }
}



