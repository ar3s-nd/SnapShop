import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project1/models/products.dart';
import 'package:project1/services/user_services.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final UserService _userService = UserService();
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('User');
  List<Product> finalList = [];
  String location = 'not-defined';

  getAddress() async {
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null){
      DocumentSnapshot doc = await userCollection.doc(user.uid).get();
      location = doc['location'];
    }
    return location;
  }

  @override
  void initState() {
    super.initState();
    _fetchCartItems();
    getAddress();
  }

  Future<void> _fetchCartItems() async {
    List<Product> cartItems = await _userService.fetchCart();
    if(mounted){
      setState(() {
        finalList = cartItems;
      });
    }
  }

  Future<void> _removeFromCart(Product product) async {
    await _userService.removeFromCart(product);
    _fetchCartItems();
  }

  incrementQuantity(int index) async {
    finalList[index].quantity++;
    await _updateCartInFirestore();
  }

  decrementQuantity(int index) async {
    finalList[index].quantity--;
    await _updateCartInFirestore();
  }

  Future<void> _updateCartInFirestore() async {
    List<Map<String, dynamic>> cart = finalList.map((product) => product.toFirestore()).toList();
    await FirebaseFirestore.instance.collection('User').doc(FirebaseAuth.instance.currentUser!.uid).update({'cart': cart});
  }

  updateTotal(double total) async {
    await FirebaseFirestore.instance.collection('User').doc(FirebaseAuth.instance.currentUser!.uid).update({'total': total.toString()});
  }

  // get total price of all items in the cart
  getTotalPrice() {
    double total = 0;
    for(Product item in finalList){
      total += item.price * item.quantity;
    }
    updateTotal(total);
    return total;
  }

  @override
  Widget build(BuildContext context) {
    // function to build the increment and decrement operations for the product quantity
    buildPoductQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          if(mounted){
            setState(() {
              icon == Icons.add
                ? incrementQuantity(index)
                : decrementQuantity(index); 
              if(finalList[index].quantity <= 0){
                _removeFromCart(finalList[index]);
                finalList.removeAt(index);
                _fetchCartItems();
                getTotalPrice();
              }
            });
          }
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurple[100],
          ),
          child: Icon(
            icon,
            size: 20
          )
        ),
      );  
    }

    return Scaffold(
      backgroundColor: Colors.white,
      // appbar
      appBar: AppBar(
        title: const Text(
          'Your Cart',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ), 
      
      body: finalList.isNotEmpty 
        // if cart is not empty show cart items
      ? Column(
        children: [
          Expanded(
            // to show the cart items
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8),

                  // slidable delete option
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            if(mounted){
                              setState(() {
                                _removeFromCart(finalList[index]);
                                finalList.removeAt(index);
                                _fetchCartItems();
                                getTotalPrice();
                              });
                            }
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        )
                      ],
                    ),

                    // cart contents
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: ListTile(
                        // product name
                        title: Text(
                          finalList[index].name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        
                        // product description
                        subtitle: Text(
                          finalList[index].description,
                          overflow: TextOverflow.ellipsis
                        ),
                        
                        // product image
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            finalList[index].image.isNotEmpty?
                            finalList[index].image[0]: 'lib/images/img_not_found.jpg',
                          ),
                          backgroundColor: Colors.deepPurple[100],
                        ),
                        
                        // to show the product quantity currentle present in the cart
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // button to add more items to the cart
                            buildPoductQuantity(Icons.add, index),
                            // show the quantity
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                finalList[index].quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 15, 
                                  fontWeight: FontWeight.bold
                                )
                              ),
                            ),
                            // button to remove items from the cart 
                            buildPoductQuantity(Icons.remove, index)
                          ],
                        ),
                        tileColor: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            )
          ),

          // to show the price and button to "buy now"
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: 100,
            decoration:  BoxDecoration(
              color: Colors.deepPurple[300],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          
                // show price
                Text(
                  '₹${getTotalPrice()}',
                  style: TextStyle(
                    fontSize: (getTotalPrice() > 1000000)? 26: 30, 
                    fontWeight: FontWeight.bold
                  )
                ),
          
                // "Check out" button
                ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.blue,
                          title: Center(
                            child: (location != 'not-defined')
                            ? Text(
                              'Your order has been placed! Thank You.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                              ),
                            ): Text(
                              'Please complete your Profile section.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                              ),
                            )

                          )
                        );
                      }
                    );
                    if(mounted && location != 'not-defined'){
                      setState(() {
                        finalList.clear();
                        _updateCartInFirestore();
                        getTotalPrice();
                      });
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
                  icon: ImageIcon(
                    const AssetImage("lib/images/icons/check_out.png"),
                    color: Colors.deepPurple.shade900,
                    size: 33,
                  ),
                  label: const Text(
                    'Check Out',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
        
        // if cart is empty say that the cart is empty
      : Center(
        child: Padding(
            padding: const EdgeInsets.only(
              top: 150,
            ),
            child: Column(
              children: [
                Image.asset(
                  'lib/images/empty_cart.png',
                  height: 170,
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Cart looks empty. Add more items now!",
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