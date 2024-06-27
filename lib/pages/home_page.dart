 import 'package:flutter/material.dart';
import 'package:project1/models/my_products.dart';
import 'package:project1/pages/details_page.dart';
import 'package:project1/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int isSelected = 0;

  // list containing the function list to build the product category page  
  final dynamic productsList = [
    _buildAllProducts(),
    _buildMobiles(),
    _buildLaptops(),
    _buildJackets(),
    _buildAnimeTShirts(),
    _buildSneakers()
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Our Products title
          const Text(
            "Our Products",
            style: TextStyle(
              fontSize: 27, 
              fontWeight: FontWeight.bold,
            )
          ),
          
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
                // build all the products categories
                _buildProductCategory(index: 0, name: "All Products"),
                _buildProductCategory(index: 1, name: "Mobiles"),
                _buildProductCategory(index: 2, name: "Laptop"),
                _buildProductCategory(index: 3, name: "Jackets"),
                _buildProductCategory(index: 4, name: "T-shirts"),
                _buildProductCategory(index: 5, name: "Sneakers"),
              ]
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: productsList[isSelected],         
          ),
        ],
      ),
    );
  }

  // build product category selector
  _buildProductCategory({required int index, required String name}) => 
  GestureDetector(
    onTap: () => setState(() {
      isSelected = index;
    }),
    child: Container(
      width: 100,
      height: 40,
      margin: const EdgeInsets.only(top:10, right:10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected == index? Colors.deepPurple: Colors.deepPurple[300], 
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.white
          )
        )
    ),
  );
}

  // show product cards for each category
_buildAllProducts() => GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: (100/140),
    crossAxisSpacing: 12,
    mainAxisSpacing: 12
  ), 
  scrollDirection: Axis.vertical,
  itemCount: MyProducts.allProducts.length,
  itemBuilder: (context, index){
    final allProducts = MyProducts.allProducts[index];
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(product: allProducts)
        )
      ),
      child: ProductCard(
        product: allProducts
      )
    );
  }
);

_buildJackets() => GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: (100/140),
    crossAxisSpacing: 12,
    mainAxisSpacing: 12
  ), 
  scrollDirection: Axis.vertical,
  itemCount: MyProducts.jacketList.length,
  itemBuilder: (context, index){
    final jacketList = MyProducts.jacketList[index];
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(product: jacketList)
        )
      ),
      child: ProductCard(
        product: jacketList
      )
    );
  }
);

_buildSneakers() => GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: (100/140),
    crossAxisSpacing: 12,
    mainAxisSpacing: 12
  ), 
  scrollDirection: Axis.vertical,
  itemCount: MyProducts.sneakersList.length,
  itemBuilder: (context, index){
    final sneakersList = MyProducts.sneakersList[index];
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(product: sneakersList)
        )
      ),
      child: ProductCard(
        product: sneakersList
      )
    );
  }
);

_buildMobiles() => GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: (100/140),
    crossAxisSpacing: 12,
    mainAxisSpacing: 12
  ), 
  scrollDirection: Axis.vertical,
  itemCount: MyProducts.mobilesList.length,
  itemBuilder: (context, index){
    final mobilesList = MyProducts.mobilesList[index];
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(product: mobilesList)
        )
      ),
      child: ProductCard(
        product: mobilesList
      )
    );
  }
);

_buildLaptops() => GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: (100/140),
    crossAxisSpacing: 12,
    mainAxisSpacing: 12
  ), 
  scrollDirection: Axis.vertical,
  itemCount: MyProducts.laptopList.length,
  itemBuilder: (context, index){
    final laptopList = MyProducts.laptopList[index];
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(product: laptopList)
        )
      ),
      child: ProductCard(
        product: laptopList
      )
    );
  }
);

_buildAnimeTShirts() => GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: (100/140),
    crossAxisSpacing: 12,
    mainAxisSpacing: 12
  ), 
  scrollDirection: Axis.vertical,
  itemCount: MyProducts.animeTShirtList.length,
  itemBuilder: (context, index){
    final animeTShirtList = MyProducts.animeTShirtList[index];
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(product: animeTShirtList)
        )
      ),
      child: ProductCard(
        product: animeTShirtList
      )
    );
  }
);