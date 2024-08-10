import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:project1/models/products.dart";
import "package:project1/services/user_services.dart";

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  final UserService _userService = UserService();
  List<Product> finalList = [];
  
  @override
  void initState() {
    super.initState();
    _fetchFavoriteItems();
  }

  Future<List<Product>> fetchProductsByIds(List<String> ids) async { // get the list of products using product id from firestore
    List<Product> products = [];
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Product')
          .where(FieldPath.documentId, whereIn: ids)
          .get();

      for (var doc in querySnapshot.docs) {
        products.add(Product.fromFirestore(doc));
      }
    } catch (e) {
      print("Error fetching products: $e");
    }
    return products;
  }

  Future<void> _fetchFavoriteItems() async {
    List<String> favoriteItemsIds = await _userService.fetchFavorites();
    List<Product> products = await fetchProductsByIds(favoriteItemsIds);
    if (mounted) {
      setState(() {
        finalList = products;
      });
    }
  }

  Future<void> _removeFromFavorite(Product product) async { // removes the product being saved as favourite in firestore
    await _userService.removeFromFavorites(product.id);
    _fetchFavoriteItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // show the products saved as favourites  
      body: finalList.isNotEmpty
      ? Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // saved items heading
                Text(
                  'Saved Items',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
          Expanded( 
            // listview.builder to show the saved products list
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        // slidable delete button
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              _removeFromFavorite(finalList[index]);
                              finalList.removeAt(index);
                              _fetchFavoriteItems();
                            });
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        )
                      ],
                    ),
                    // list items
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: ListTile(
                        // item name
                        title: Text(
                          finalList[index].name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // item description
                        subtitle: Text(
                          finalList[index].description,
                          overflow: TextOverflow.ellipsis
                        ),
                        // item image
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            finalList[index].image[0],
                          ),
                          backgroundColor: Colors.deepPurple[100],
                        ),
                        // item price
                        trailing: Text(
                          '₹${finalList[index].price}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        tileColor: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            )
          )
        ],
      )
      // show that the favourites/saved list is empty
      : Center(
        child: Padding(
            padding: const EdgeInsets.only(
              top: 150,
            ),
            child: Column(
              children: [
                Image.asset(
                  'lib/images/favorite_empty.png',
                  height: 220,
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "You haven't saved anything yet. Save them now!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25, 
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 3, 88, 158)
                    )
                  ),
                ),
              ]
            )
        ),
      )
    );
  }
}