import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project1/providers/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // provider for cart contents
    final provider = CartProvider.of(context);
    final finalList = provider.cart;

    // function to build the increment and decrement operations for the product quantity
    buildPoductQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQuantity(index)
                : provider.decrementQuantity(index); 
            if(finalList[index].quantity == 0){
              finalList.removeAt(index);
            }
          });
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
                            finalList.removeAt(index);
                            setState(() {});
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
                            finalList[index].image![0],
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
                  '₹${provider.getTotalPrice()}',
                  style: TextStyle(
                    fontSize: (provider.getTotalPrice() > 1000000)? 26: 30, 
                    fontWeight: FontWeight.bold
                  )
                ),
          
                // "Check out" button
                ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          backgroundColor: Colors.blue,
                          title: Center(
                            child: Text(
                              'Your order has been placed! Thank You.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                              ),
                            )
                          )
                        );
                      }
                    );
                    setState(() {
                      finalList.clear();
                    });
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