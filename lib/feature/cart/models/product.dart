// class Product {
//    String? id;
//   String? name;
//   final String image;
//   double? price;
//   final String category;
//   final String description;

//   Product({
//      this.id,
//     this.name,
//     required this.image,
//      this.price,
//     this.category = 'Smartphone',
//     this.description = 'A great smartphone for your needs.',
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//      print("Parsing product JSON: $json");
//     if (json['_id'] == null || json['name'] == null || json['price'] == null) {
//       throw const FormatException(
//         'Missing required fields in JSON: _id, or price',
//       );
//     }

//     String imagePath = _getImagePath(json['name']);

//     return Product(
//       id: json['_id'].toString(),
//       name: json['name'],
//       price: double.tryParse(json['price'].toString()) ?? 0.0,
//       image: imagePath,
//     );
//   }

//   static String _getImagePath(String name) {
//     final imageMap = {
//       'iphone': 'assets/iphone.jpg',
//       'oppo': 'assets/oppo.jpg',
//       'pixel': 'assets/pixel.jpg',
//       'realme': 'assets/realme.jpg',
//       'redmi': 'assets/redmi.jpg',
//       'samsung': 'assets/samsung.jpg',
//       'nothing': 'assets/default.jpg',
//       'motorola': 'assets/default.jpg',
//       'infinix': 'assets/default.jpg',
//       'note 10s': 'assets/default.jpg',
//     };

//     return imageMap[name.toLowerCase()] ?? 'assets/default.jpg';
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'price': price.toString(),
//     };
//   }
// }



// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String? id;
    String? name;
    String? price;
    int? v;
    String? description;
    String? image;

    Product({
        this.id,
        this.name,
        this.price,
        this.v,
        this.description,
        this.image,
    });

    factory Product.fromJson(Map<String, dynamic> json) {
      String name = json['name'].toString().toLowerCase();
      String localImage = _getImagePath(name);
    return  Product(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        v: json["__v"],
          description: json["description"] ?? 'No description available',
          image: localImage,
    );
    }

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "__v": v,
        "description":description,
        "image":image,
    };
      static String _getImagePath(String name) {
    final imageMap = {
      'iphone': 'assets/iphone.jpg',
      'oppo': 'assets/oppo.jpg',
      'pixel': 'assets/pixel.jpg',
      'realme': 'assets/realme.jpg',
      'redmi': 'assets/redmi.jpg',
      'samsung': 'assets/samsung.jpg',
      'nothing': 'assets/default.jpg',
      'motorola': 'assets/default.jpg',
      'infinix': 'assets/default.jpg',
      'note 10s': 'assets/default.jpg',
    };
     return imageMap[name] ?? 'assets/default.jpg';
      }
}


















// class Product {
//   final String id;
//   final String name;
//   final String category;
//   final String image;
//   final String description;
//   final double price;

//   Product({
//     required this.id,
//     required this.name,
//     this.category = 'Smartphone',
//     required this.image,
//     this.description = 'A great smartphone for your needs.',
//     required this.price,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     if (json['id'] == null || json['name'] == null || json['price'] == null) {
//       throw const FormatException(
//           'Missing required fields in JSON: id, name, or price');
//     }
//     String imagePath = _getImagePath(json['name']);
//     return Product(
//       id: json['id'].toString(),
//       name: json['name'],
//       price: double.parse(json['price'].toString()),
//       image: imagePath,
//       category: json['category'] ?? 'Smartphone',
//       description: json['description'] ?? 'A great smartphone',
//     );
//   }

//   static String _getImagePath(String name) {
//     final imageMap = {
//       'iphone': 'assets/iphone.jpg',
//       'oppo': 'assets/oppo.jpg',
//       'pixel': 'assets/pixel.jpg',
//       'realme': 'assets/realme.jpg',
//       'redmi': 'assets/redmi.jpg',
//       'samsung': 'assets/samsung.jpg',
//     };
//     String? imagePath = imageMap[name.toLowerCase()];
//     if (imagePath == null) {
//       return 'assets/default.jpg';
//     }
//     return imagePath;
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'category': category,
//       'image': image,
//       'description': description,
//       'price': price,
//     };
//   }
// }



