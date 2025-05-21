
class Product {
  final String image;
  final String title;
  final String description;
  final String price;

  Product({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });

  factory Product.fromJSON(Map<String, dynamic> json) { 
    return Product(
      image: json['image'],
      title: json['title'],
      description: json['description'] ?? "Produto sem Descrição",
      price: json['price'].toString()
      );
  }
}
