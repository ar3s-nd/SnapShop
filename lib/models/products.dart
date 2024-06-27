// Product class to store product details
class Product {
   final int id;
   final String name, category, description, type;
   List<String>? image;
   final double price;
   int quantity;

   Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.image,
    required this.quantity,
    required this.type
   });

   
}