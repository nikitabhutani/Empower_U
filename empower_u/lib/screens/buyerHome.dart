import 'package:empower_u/screens/yourcart.dart';
import 'package:flutter/material.dart';

class BuyerHome extends StatefulWidget {
  @override
  _BuyerHomeState createState() => _BuyerHomeState();
}
 
class _BuyerHomeState extends State<BuyerHome> {
  
  
  final List<Artwork> availableArtworks = [
    // ... your artwork list ...
    Artwork(
      name: 'Scarf',
      artist: 'Shraddha ',
      price: 400,
      image: 'assets/images/scarf.jpeg',
    ),
    Artwork(
      name: 'Suit',
      artist: 'Nisha Laur',
      price: 1250,
      image: 'assets/images/suit.jpeg',
    ),
    Artwork(
      name: 'Saree',
      artist: 'Nikita Bhutani',
      price: 1150,
      image: 'assets/images/saree.jpeg',
    ),
    Artwork(
      name: 'Skirt',
      artist: 'Riya Agarwal',
      price: 1140,
      image: 'assets/images/skirt.jpeg',
    ),

    Artwork(
      name: 'Lehenga',
      artist: 'Samiksha',
      price: 4200,
      image: 'assets/images/lehenga.jpeg',
    ),
    Artwork(
      name: 'Black Denim',
      artist: 'Suhani Shah',
      price: 1200,
      image: 'assets/images/blackdenim.jpeg',
    ),
    Artwork(
      name: 'Black Dress',
      artist: 'Seeta Kumari',
      price: 1200,
      image: 'assets/images/blackdress.jpeg',
    ),
    Artwork(
      name: 'Crop top',
      artist: 'Harshita Verma',
      price: 700,
      image: 'assets/images/croptop.jpeg',
    ),
  ];

  List<Artwork> filteredArtworks = [];

  @override
  void initState() {
    super.initState();
    filteredArtworks = availableArtworks;
  }

  void _filterArtworks(String query) {
    setState(() {
      filteredArtworks = availableArtworks
          .where((artwork) =>
              artwork.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void showConfirmationDialog(BuildContext context, Artwork artwork) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Purchase'),
          content: Text(
              'Are you sure you want to buy ${artwork.name} for Rs.${artwork.price}?'),
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
                Navigator.of(context).pop();
                showPurchaseConfirmationDialog(context, artwork);
              },
            ),
          ],
        );
      },
    );
  }

  void showPurchaseConfirmationDialog(BuildContext context, Artwork artwork) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Purchase Successful'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                artwork.image,
                width: 100.0,
                height: 100.0,
              ),
              SizedBox(height: 10.0),
              Text('${artwork.name} purchased successfully!'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Products'),
        backgroundColor: Colors.indigo[900], // Set app bar color
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final query = await showSearch<String>(
                context: context,
                delegate: ArtworkSearchDelegate(
                  availableArtworks,
                  showConfirmationDialog,
                ),
              );
              if (query != null) {
                _filterArtworks(query);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredArtworks.length,
        itemBuilder: (BuildContext context, int index) {
          final artwork = filteredArtworks[index];
          return ListTile(
            leading: Image.asset(
              artwork.image,
              width: 50.0,
              height: 50.0,
            ),
            title: Text(artwork.name),
            subtitle: Text('By ${artwork.artist}'),
            trailing: Text('Rs ${artwork.price}'),
            onTap: () {
              showConfirmationDialog(context, artwork);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(),
            ),
          );
          
        },
        backgroundColor: Colors.indigo.shade900,
        icon: Icon(Icons.shopping_cart),
        label: Text('Your Cart'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class Artwork {
  final String name;
  final String artist;
  final double price;
  final String image;

  Artwork({
    required this.name,
    required this.artist,
    required this.price,
    required this.image,
  });
}

class ArtworkSearchDelegate extends SearchDelegate<String> {
  final List<Artwork> artworks;
  final Function(BuildContext, Artwork) showConfirmationDialog;

  ArtworkSearchDelegate(this.artworks, this.showConfirmationDialog);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, query);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: artworks.length,
      itemBuilder: (BuildContext context, int index) {
        final artwork = artworks[index];
        return ListTile(
          leading: Image.asset(
            artwork.image,
            width: 50.0,
            height: 50.0,
          ),
          title: Text(artwork.name),
          subtitle: Text('By ${artwork.artist}'),
          trailing: Text('Rs ${artwork.price}'),
          onTap: () {
            showConfirmationDialog(context, artwork);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? artworks
        : artworks
            .where((artwork) =>
                artwork.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext context, int index) {
        final artwork = suggestionList[index];
        return ListTile(
          leading: Image.asset(
            artwork.image,
            width: 50.0,
            height: 50.0,
          ),
          title: Text(artwork.name),
          subtitle: Text('By ${artwork.artist}'),
          trailing: Text('Rs ${artwork.price}'),
          onTap: () {
            showConfirmationDialog(context, artwork);
          },
        );
      },
    );
  }
}
