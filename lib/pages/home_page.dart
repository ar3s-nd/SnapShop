import 'package:flutter/material.dart';
import 'package:project1/models/products.dart';
import 'package:project1/pages/details_page.dart';
import 'package:project1/services/product_services.dart';
import 'package:project1/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int isSelected = 0;

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
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // build all the product categories
                _buildProductCategory(index: 0, name: "All Products"),
                _buildProductCategory(index: 1, name: "Mobiles"),
                _buildProductCategory(index: 2, name: "Laptop"),
                _buildProductCategory(index: 3, name: "Jackets"),
                _buildProductCategory(index: 4, name: "T-shirts"),
                _buildProductCategory(index: 5, name: "Sneakers"),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _buildProductCategoryPage(isSelected),
          ),
        ],
      ),
    );
  }

  // build product category selector
  _buildProductCategory({required int index, required String name}) => GestureDetector(
        onTap: () => setState(() {
          isSelected = index;
        }),
        child: Container(
          width: 100,
          height: 40,
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index ? Colors.deepPurple : Colors.deepPurple[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(name, style: const TextStyle(color: Colors.white)),
        ),
      );

  Widget _buildProductCategoryPage(int index) {
    switch (index) {
      case 0:
        return _buildAllProducts();
      case 1:
        return _buildMobiles();
      case 2:
        return _buildLaptops();
      case 3:
        return _buildJackets();
      case 4:
        return _buildAnimeTShirts();
      case 5:
        return _buildSneakers();
      default:
        return Container();
    }
  }

  Widget _buildAllProducts() { // build list of all products
    return FutureBuilder<List<Product>>(
      future: ProductService().fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No products found'));
        } else {
          final allProducts = snapshot.data!;
          return _buildGridView(allProducts);
        }
      },
    );
  }

  Widget _buildJackets() { // build a list of only jackets
    return FutureBuilder<List<Product>>(
      future: ProductService().fetchProductsByType('Jacket'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No jackets found'));
        } else {
          final jackets = snapshot.data!;
          return _buildGridView(jackets);
        }
      },
    );
  }

  Widget _buildSneakers() { // build a list of only sneakers
    return FutureBuilder<List<Product>>(
      future: ProductService().fetchProductsByType('Sneaker'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No sneakers found'));
        } else {
          final sneakers = snapshot.data!;
          return _buildGridView(sneakers);
        }
      },
    );
  }

  Widget _buildMobiles() { // build a list of only mobiles
    return FutureBuilder<List<Product>>(
      future: ProductService().fetchProductsByType('Mobile'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No mobiles found'));
        } else {
          final mobiles = snapshot.data!;
          return _buildGridView(mobiles);
        }
      },
    );
  }

  Widget _buildLaptops() { // build a list of only laptops
    return FutureBuilder<List<Product>>(
      future: ProductService().fetchProductsByType('Laptop'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No laptops found'));
        } else {
          final laptops = snapshot.data!;
          return _buildGridView(laptops);
        }
      },
    );
  }

  Widget _buildAnimeTShirts() { // build a list of only t-shirts 
    return FutureBuilder<List<Product>>(
      future: ProductService().fetchProductsByType('Anime T-shirt'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No T-shirts found'));
        } else {
          final tShirts = snapshot.data!;
          return _buildGridView(tShirts);
        }
      },
    );
  }

  Widget _buildGridView(List<Product> products) { // build the grid view to show the product card
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(product: product),
            ),
          ),
          child: ProductCard(product: product),
        );
      },
    );
  }
}
