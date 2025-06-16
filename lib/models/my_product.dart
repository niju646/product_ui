import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:product_ui/models/product.dart';

class MyProduct {
  Future<List<Product>> get allProducts async {
    try {
      final response = await http
          .get(
            Uri.parse('https://cart-app-backend-3nff.onrender.com/api/product'),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        List jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((data) => Product.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}







// import 'package:product_ui/models/product.dart';

// class MyProduct {
//   final List<Product> allProducts = [
//     Product(
//         id: 1,
//         name: 'iphone',
//         category: 'mobile',
//         image: 'assets/iphone.jpg',
//         description:
//             'It has the rounded cornersthat follows a beautiful curved design, and these conrners are within a standard rectangle. when measured as a standard rectangular shape  the screen is 15.54 cm diagonally.',
//         price: 50000),
//     Product(
//         id: 2,
//         name: 'samsung',
//         category: "mobile",
//         image: 'assets/samsung.jpg',
//         description:
//             'This is the device which shares the same lineup and scteen sizes with the previous galaxy series.this phone features a flat 6.1-inch dispaly with a variable refresh reate from 48Hz to 120 Hz 8 Gb of RAM, and storage options from 128 GB to 512 GB.',
//         price: 30000),
//     Product(
//         id: 3,
//         name: 'pixel',
//         category: 'mobile',
//         image: 'assets/pixel.jpg',
//         description: 'The Google Pixel 9 Pro is a high-end smartphone featuring a 6.3-inch QHD+ OLED display with a 120Hz refresh rate, powered by the Google Tensor G4 processor. It offers up to 16GB RAM and 256GB storage, a triple-camera setup (50MP main, 48MP telephoto, 48MP ultrawide), and a 42MP front camera. The device also includes a 5060mAh battery with fast charging capabilities. ',
//         price: 60000),
//     Product(
//         id: 4,
//         name: 'redmi',
//         category: 'redmi',
//         image: 'assets/redmi.jpg',
//         description: 'A mid-range smartphones that offer a balanced combination of features and performance. It generally features a 6.67-inch AMOLED display with a 120Hz refresh rate, a MediaTek Helio G99 or Snapdragon 7s Gen 3 processor, and a triple-camera system. ',
//         price: 20000),
//     Product(
//         id: 5,
//         name: 'oppo',
//         category: 'mobile',
//         image: 'assets/oppo.jpg',
//         description: 'A budget-friendly smartphone known for its large, Full HD+ display, 50MP main camera, and long-lasting battery. It features a 6.6-inch LCD screen, a 5000mAh battery with 18W fast charging, and a Unisoc T616 processor. The phone also has a 50MP AI triple camera setup, including a macro lens and a B&W portrait lens.',
//         price: 25000),
//     Product(
//         id: 6,
//         name: 'realme',
//         category: 'mobile',
//         image: 'assets/realme.jpg',
//         description: ' A mid-range smartphone focusing on gaming and photography. It boasts a 50MP OIS AI camera, a 6000mAh Titan battery with 45W fast charging, and a 120Hz AMOLED display, all powered by the Snapdragon 6 Gen 4 5G chipset. It features a unique Mecha Design with a Victory Halo Light and boasts IP69 top-tier waterproof capabilities. ',
//         price: 10000),
//   ];
// }
