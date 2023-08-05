// import 'package:flutter/material.dart';

// import 'buyerHome.dart';

// class CartPage extends StatelessWidget {
//   final List<Artwork> cartItems;

//   CartPage(this.cartItems);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Cart'),
//       ),
//       body: ListView.builder(
//         itemCount: cartItems.length,
//         itemBuilder: (BuildContext context, int index) {
//           final artwork = cartItems[index];
//           return ListTile(
//             leading: Image.asset(
//               artwork.image,
//               width: 50.0,
//               height: 50.0,
//             ),
//             title: Text(artwork.name),
//             subtitle: Text('By ${artwork.artist}'),
//             trailing: Text('Rs ${artwork.price}'),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Artwork> purchasedArtworks = [
    Artwork(
      name: 'Suit',
      amount: 1550,
      image: 'assets/images/suit.jpeg',
    ),
    Artwork(
      name: 'Saree',
      amount: 1175,
      image: 'assets/images/saree.jpeg',
    ),
    Artwork(
      name: 'Scarf',
      amount: 400,
      image: 'assets/images/scarf.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: ListView.builder(
        itemCount: purchasedArtworks.length,
        itemBuilder: (BuildContext context, int index) {
          final artwork = purchasedArtworks[index];
          return ListTile(
            leading: Image.asset(
              artwork.image,
              width: 50.0,
              height: 50.0,
            ),
            title: Text(artwork.name),
            subtitle: Text('Amount: Rs. ${artwork.amount}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: Rs. ${calculateTotalAmount()}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle Buy option
                      _showPurchaseDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                    primary: Colors.indigo.shade900,
                  ),
                    child: Text('Buy'),
                  ),
                  SizedBox(width: 10.0),
                  ElevatedButton(
                     
                    onPressed: () {
                      // Handle Cancel option
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                    primary: Colors.indigo.shade900,
                  ),
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateTotalAmount() {
    double total = 0;
    for (var artwork in purchasedArtworks) {
      total += artwork.amount;
    }
    return total;
  }

  void _showPurchaseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Purchase'),
          content: Text('Are you sure you want to make this purchase?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Buy'),
              onPressed: () {
                // Handle purchase logic
                // For example, you can clear the cart after purchase
                purchasedArtworks.clear();
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Close cart page
              },
            ),
          ],
        );
      },
    );
  }
}

class Artwork {
  final String name;
  final double amount;
  final String image;

  Artwork({required this.name, required this.amount, required this.image});
}
