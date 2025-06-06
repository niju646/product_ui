import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_ui/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoriteProvider>(context).favorite;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "My Favorites",
          style: TextStyle(
            color: Colors.blue[300],
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        // centerTitle: true,
      ),
      body: favorites.isEmpty
          ? _buildEmptyFavorites()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "${favorites.length} ${favorites.length == 1 ? 'item' : 'items'} in favorites",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      final item = favorites[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          leading: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[100],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item.image,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
                              children: [
                                Text(
                                  '₹${item.price.toInt()}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green[700],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  CupertinoIcons.heart_fill,
                                  size: 14,
                                  color: Colors.pink[400],
                                ),
                              ],
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Container(
                              //   decoration: BoxDecoration(
                              //     color: Colors.blue[50],
                              //     borderRadius: BorderRadius.circular(8),
                              //   ),
                              //   child: IconButton(
                              //     onPressed: () {
                              //       // Add to cart functionality
                              //       ScaffoldMessenger.of(context).showSnackBar(
                              //         SnackBar(
                              //           content: Text('${item.name} added to cart'),
                              //           backgroundColor: Colors.green,
                              //           duration: const Duration(seconds: 2),
                              //         ),
                              //       );
                              //     },
                              //     icon: Icon(
                              //       CupertinoIcons.cart_badge_plus,
                              //       color: Colors.blue[600],
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(width: 8),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.pink[50],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    _showRemoveDialog(context, item);
                                  },
                                  icon: Icon(
                                    CupertinoIcons.heart_slash,
                                    color: Colors.pink[600],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildEmptyFavorites() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.heart,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            "No favorites yet",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Start adding items to your favorites",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
          // const SizedBox(height: 24),
          // ElevatedButton.icon(
          //   onPressed: () {
          //     // Navigate back or to products screen
          //   },
          //   icon: const Icon(CupertinoIcons.search, color: Colors.white),
          //   label: const Text(
          //     "Browse Products",
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.pink[600],
          //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  void _showRemoveDialog(BuildContext context, dynamic item) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("Remove from Favorites"),
          content: Text(
              "Are you sure you want to remove '${item.name}' from your favorites?"),
          actions: [
            CupertinoDialogAction(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text("Remove"),
              onPressed: () {
                Provider.of<FavoriteProvider>(context, listen: false)
                    .deletefavorite(item);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.name} removed from favorites'),
                    backgroundColor: Colors.orange,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:product_ui/providers/favorite_provider.dart';
// import 'package:provider/provider.dart';

// class FavoriteScreen extends StatelessWidget {
//   const FavoriteScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final favorites = Provider.of<FavoriteProvider>(context).favorite;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text("Favorites",style: TextStyle(
//           color: Colors.blue[300],
//           fontWeight: FontWeight.bold,
//         ),),
//         elevation: 0,
//       ),
//       body: ListView.builder(
//         itemCount: favorites.length,
//         itemBuilder: (context,index){
//           final item = favorites[index];
//           return ListTile(
//               leading: Image.asset(item.image,width: 50,),
//               title: Text(item.name),
//               subtitle: Text('Rs.${item.price.toInt()}'),
//               trailing: IconButton(onPressed: (){
//                 Provider.of<FavoriteProvider>(context,listen: false).deletefavorite(item);
//               }, icon: Icon(CupertinoIcons.delete)),
//           );
//       }),
//     );
//   }
// }
