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
    if (json['_id'] == null || json['name'] == null || json['price'] == null) {
      throw const FormatException(
          'Missing required fields in JSON: id, name, or price');
    }
    String imagePath = _getImagePath(json['name']);
    return Product(
      id: json['_id'],
      name: json['name'],
      price: double.parse(json['price'].toString()),
      image: imagePath,
    );
  }

  static String _getImagePath(String name) {
    final imageMap = {
      'iphone': 'assets/iphone.jpg',
      'oppo': 'assets/oppo.jpg',
      'pixel': 'assets/pixel.jsg',
      'realme': 'assets/realme.jpg',
      'redmi': 'assets/redmi.jpg',
      'samsung': 'assets/samsung.jpg',

    };

    return  imageMap[name] ?? 'assets/default.jpg';
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'category': category,
      'image': image,
      'description': description,
      'price': price,
    };
  }
}
