import 'package:flutter/material.dart';
import '../product.dart'; // تأكد أن الكلاس داخل هذا الملف اسمه Product
import '../database.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  Future<List<Product>> fetchProducts() async {
    final data = await FakeDatabase.getProducts();
    return data.map((e) => Product.fromMap(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: FutureBuilder<List<Product>>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          // 1. التحقق من حالة التحميل أو الخطأ
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("حدث خطأ ما: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("لا توجد منتجات متاحة"));
          }

          // 2. استخراج البيانات بأمان
          final products = snapshot.data!;

          // 3. عرض القائمة
          return ListView(
            children: products.map((p) {
              return Card(
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            p.name, // تأكد أن الاسم مطابق لما في الكلاس
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(p.brand),
                          Text(p.description),
                        ],
                      ),
                      Text("${p.price} SAR"), // تعديل طريقة كتابة المتغير هنا
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
