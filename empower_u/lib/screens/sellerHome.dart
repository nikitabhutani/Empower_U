import 'package:empower_u/screens/productsinfo.dart';
import 'package:flutter/material.dart';

class SellerHomePageContent extends StatelessWidget {
  final List<Product> uploadedProducts = [
    Product(
      name: 'Suit',
      price: 50,
      image: 'assets/images/suit.jpeg',
    ),
    Product(
      name: 'Blue Dress',
      price: 75,
      image: 'assets/images/bluedress.jpeg',
    ),
    Product(
      name: 'Crop Top',
      price: 100,
      image: 'assets/images/croptop.jpeg',
    ),
  ];

  final String userProfilePhoto = 'assets/images/profile_photo.png'; 

  double calculateTotalProfit() {
    double total = 0;
    for (var product in uploadedProducts) {
      total += product.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Profile'),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: Column(
        children: [
          SizedBox(height: 16.0),
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage(userProfilePhoto),
          ),
          SizedBox(height: 16.0),
          Text(
            'Total Profit Earned: Rs. ${calculateTotalProfit()}',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: uploadedProducts.length,
              itemBuilder: (BuildContext context, int index) {
                final product = uploadedProducts[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, product.image);
                      },
                      child: Image.asset(
                        product.image,
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                    title: Text(product.name),
                    subtitle: Text('Price: Rs. ${product.price}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProductPage(),
            ),
          );
        },
        backgroundColor: Colors.indigo.shade900,
        child: Icon(Icons.add),
      ),
    );
  }

  void _showImageDialog(BuildContext context, String imageAsset) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(imageAsset),
          ),
        );
      },
    );
  }
}

class Product {
  final String name;
  final double price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}
