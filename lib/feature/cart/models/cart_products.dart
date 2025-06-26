
import 'dart:convert';

CartProducts cartProductsFromJson(String str) => CartProducts.fromJson(json.decode(str));

String cartProductsToJson(CartProducts data) => json.encode(data.toJson());

class CartProducts {
    String productId;
    String name;
    String price;
    int quantity;
    String? image;

    CartProducts({
        required this.productId,
        required this.name,
        required this.price,
        required this.quantity,
        this.image,
    });

    factory CartProducts.fromJson(Map<String, dynamic> json) {
      String name = json['name'].toString().toLowerCase();
      String localImage = _getImagePath(name);
      return CartProducts(
        productId: json["productId"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        image: localImage,
        
    );
    }

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": name,
        "price": price,
        "quantity": quantity,
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



// //CartProducts
// class CartProducts {
//   final int productId;
//   final String name;
//   final double price;
//   final int quantity;
//   final String image;

//   CartProducts({
//     required this.name,
//     required this.price,
//     required this.productId,
//     required this.quantity,
//     required this.image,
//   });

//   factory CartProducts.fromJson(Map<String, dynamic> json) {
//     if ((json['id'] ?? json['product_id']) == null ||
//         json['name'] == null ||
//         json['price'] == null) {
//       throw const FormatException(
//           'Missing required fields in JSON: id/product_id, name, or price');
//     }
//     String imagePath = _getImagePath(json['name'] ?? '');

//     return CartProducts(
//       name: json['name'],
//       price: double.parse(json['price'].toString()),
//       productId: int.parse(json['product_id'].toString()),
//       quantity: json['quantity'] as int? ?? 1,
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
//     };
//     String? imagePath = imageMap[name.toLowerCase()];
//     if (imagePath == null) {
//       return 'assets/default.jpg';
//     }
//     return imagePath;
//   }
// }
