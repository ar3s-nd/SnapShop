import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project1/services/user_services.dart';
import 'package:project1/widgets/colour_circle.dart';
import 'package:project1/models/products.dart';
import 'package:project1/pages/cart_page.dart';
import 'package:project1/widgets/available_option.dart';
import 'package:project1/widgets/scrollable_images.dart';

class DetailsPage extends StatefulWidget {
  final Product product; 
  const DetailsPage({super.key, required this.product});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  // check if the product is tagged as favorite in firestore
  Future<void> _checkFavoriteStatus() async {
    bool exists = await UserService().isExistInFavorite(widget.product.id);
    setState(() {
      isFavorite = exists;
    });
  }

  Future<void> _toggleFavorite() async { // add or remove from favourites in firestore
    if (isFavorite) {
      await UserService().removeFromFavorites(widget.product.id);
    } else {
      await UserService().addToFavorites(widget.product.id);
    }
    _checkFavoriteStatus();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // to show the cancel icon which pops the current context
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 10
                    ),
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        'lib/images/icons/cross_icon.svg',
                        height: 25,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  // to show the scrollable images of the prduct
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 220,
                        height: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.deepPurple[100],
                        ),
                        // images of the product
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          // scrollable images
                          child: ScrollableImages(imagePaths: widget.product.image),
                        )
                      )
                    ],
                  ),
                  
                  // show the name, price, descriptions and the availabilities of the product
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // product name
                            Text(
                              widget.product.name,
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            
                            // product price
                            const SizedBox(width:20),
                            Text(
                              '₹${widget.product.price}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                          
                        // description
                        const SizedBox(height: 20),
                        Text(
                          widget.product.description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        
                        // Available configurations if product is electronics product, else size
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Available Options:',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                              )
                            )
                          ],
                        ),
                          
                        const SizedBox(height: 8),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child:(widget.product.type == 'Mobile') // product is of type 'Mobile'
                            ? const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AvailableOptions(size: '6GB, 128GB'),
                                AvailableOptions(size: '8GB, 128GB'),
                                AvailableOptions(size: '8GB, 256GB'),
                              ],
                            )
                            : (widget.product.type == 'Laptop') // product is of type 'Laptop'
                            ? const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AvailableOptions(size: '4GB, 512GB'),
                                AvailableOptions(size: '8GB, 512GB'),
                              ],
                            )
                            : const Row( // product belongs to [sneakers, jackets, t-shirts]
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AvailableOptions(size: "US 6"),
                                AvailableOptions(size: "US 7"),
                                AvailableOptions(size: "US 8"),
                                AvailableOptions(size: "US 9"),
                              ],
                          ),
                        ),

                        // Available colors for the products
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Available colors:',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                              )
                            )
                          ],
                        ),
                          
                        const SizedBox(height: 8),
                        (widget.product.type == 'Mobile') // product is of type 'Mobile'
                        ? Row(
                          children: [
                            const ColourCircle(color: Colors.black),
                            ColourCircle(color: Colors.grey[200]),
                            const ColourCircle(color: Colors.cyan)
                          ],
                        )
                        : (widget.product.type == 'Laptop') // product is of type 'Laptop'
                        ? Row(
                          children: [
                            ColourCircle(color: Colors.blue[800]),
                            const ColourCircle(color: Colors.black),
                          ],
                        )
                        : const Row( // product belongs to [sneakers, jackets, t-shirts]
                          children: [
                            ColourCircle(color: Colors.black),
                            ColourCircle(color: Colors.white),
                            ColourCircle(color: Colors.blue)
                          ],
                        ),
              
                        // Availability of the product (In stock or out of stock)
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Availability: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16
                                )
                              ),
              
                              // show availblility
                              Text(
                                (widget.product.category == 'Out of Stock')
                                ? widget.product.category
                                : 'In Stock',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: widget.product.category == 'Out of Stock'
                                  ? const Color.fromARGB(255, 255, 0, 0) : Color.fromARGB(255, 212, 103, 13),
                                  fontSize: 18
                                )
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],  
              ),
            ],
          ),
        ),
      ),
      
      // bar which show the price and add to cart button
      bottomSheet: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 10,
          decoration: const BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // price
              Text(
                '₹${widget.product.price}',
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),

              // cart or save button according to availability of the item (in stock or not)
              ElevatedButton.icon(
                onPressed: () {
                  if(widget.product.category != 'Out of Stock'){ // if item is in stock then show cart button and add it to cart and got to cart page when pressed
                    widget.product.quantity = 1;
                    UserService().addToCart(widget.product); 
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(), 
                      )
                    );
                  } else { // if item is out of stock add to saved list
                    _toggleFavorite();
                  }
                },
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.pressed)) {
                        return const Color.fromARGB(255, 47, 143, 207).withOpacity(0.8);
                      }
                      return Colors.transparent;
                    },
                  ),
                ),
                icon: (widget.product.category != 'Out of Stock') // if product is in stock show add to cart button
                  ? const ImageIcon(
                    AssetImage("lib/images/icons/cart_it.png"),
                    color: Colors.deepPurple,
                    size: 25,
                  ) : ImageIcon( // if prduct is out of stock show button which adds it to user favourites or "saves it".
                        AssetImage(
                          isFavorite
                          ? 'lib/images/icons/favorite_icon/favorite_selected.png'
                          : 'lib/images/icons/favorite_icon/favorite_unselected.png'
                        ),
                        color: Colors.red,
                      ),
                label: Text(
                  widget.product.category != 'Out of Stock' 
                  ? 'Cart it!'
                  : isFavorite
                    ? ' Saved!'
                    : 'Save it!',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}