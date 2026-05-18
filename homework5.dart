class Product {
  final String name;
  final String brand;
  final String description;
  final double price;

  Product({
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      brand: map['brand'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
    );
  }
}





