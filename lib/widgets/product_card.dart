import 'package:flutter/material.dart';
import 'package:project1/models/products.dart';
import 'package:project1/services/user_services.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  // check if the product is tagged as favourite in firestore
  Future<void> _checkFavoriteStatus() async {
    bool exists = await UserService().isExistInFavorite(widget.product.id);
    if(mounted){
      setState(() {
        isFavorite = exists;
      });
    }
  }

  Future<void> _toggleFavorite() async {
    if (isFavorite) {
      await UserService().removeFromFavorites(widget.product.id);
    } else {
      await UserService().addToFavorites(widget.product.id);
    }
    _checkFavoriteStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => _toggleFavorite(),

                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    right: 8,
                  ),

                  // change the image for whether the product is saved as favourites or not
                  child: Image.asset(
                    isFavorite
                        ? 'lib/images/icons/favorite_icon/favorite_selected.png'
                        : 'lib/images/icons/favorite_icon/favorite_unselected.png',
                    height: 25,
                    color: Colors.red,
                    semanticLabel: 'Favorite',
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 100,
            width: 130,

            // show the image of product
            child: Image.asset(
              widget.product.image.isNotEmpty
                  ? widget.product.image[0]
                  : 'lib/images/img_not_found.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),

          // product name
          Text(
            widget.product.name,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),

          // product category(whether 'Trending Now', 'In Stock' or 'Out of stock')
          Text(
            widget.product.category,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text(
            '₹${widget.product.price}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
