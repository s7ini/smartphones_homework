class FakeDatabase {
  static Future<List<Map<String, dynamic>>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      {
        "name": "Football",
        "brand": "Nike",
        "description": "High quality football",
        "price": 120.0,
      },
      {
        "name": "Basketball",
        "brand": "Adidas",
        "description": "Indoor/outdoor ball",
        "price": 150.0,
      },
    ];
  }
}
