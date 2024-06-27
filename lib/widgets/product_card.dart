import 'package:flutter/material.dart';
import 'package:project1/models/products.dart';
import 'package:project1/providers/favorite_provider.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    // provider to get info about the product
    final provider = FavoriteProvider.of(context);

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
                onTap: () => provider.toggleFavorite(widget.product),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    right: 8
                  ),
                  child: Image.asset(
                    provider.isExist(widget.product)?
                    'lib/images/icons/favorite_icon/favorite_selected.png':
                    'lib/images/icons/favorite_icon/favorite_unselected.png', 
                    height: 25,                
                    color: Colors.red,
                    semanticLabel: 'Favorite',
                  ),
                ),
              )
            ]
          ),
          SizedBox(
            height: 100,
            width: 130,
            child: Image.asset(
              widget.product.image![0],
              fit: BoxFit.fitHeight
            )
          ),
          Text(
            widget.product.name,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold
            )
          ),
          Text(
            widget.product.category,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.red
            ),
          ),
          Text(
            '₹${widget.product.price}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      )
    );
  }
}