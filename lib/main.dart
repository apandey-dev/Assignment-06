import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Main App Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic UI Assignment',
      theme: ThemeData(
        // Using a basic blue theme for the app
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ProductCatalogScreen(),
    );
  }
}

// Product class to hold the item details
class Product {
  final String name;
  final String description;
  final String price;
  final IconData icon;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.icon,
  });
}

// Stateful screen because we need to switch views and count clicks
class ProductCatalogScreen extends StatefulWidget {
  const ProductCatalogScreen({super.key});

  @override
  State<ProductCatalogScreen> createState() => _ProductCatalogScreenState();
}

class _ProductCatalogScreenState extends State<ProductCatalogScreen> {
  // Boolean to check if we should display GridView or ListView
  bool _isGridView = false;

  // Counter to keep track of how many times the offer button is clicked
  int _buttonClickCount = 0;

  // Sample items list (Products)
  final List<Product> _products = [
    Product(name: 'Laptop', description: 'High performance gaming laptop', price: '\$999', icon: Icons.laptop),
    Product(name: 'Smartphone', description: 'Latest 5G Android phone', price: '\$699', icon: Icons.phone_android),
    Product(name: 'Headphones', description: 'Wireless noise cancelling', price: '\$199', icon: Icons.headphones),
    Product(name: 'Smartwatch', description: 'Fitness tracker with GPS', price: '\$149', icon: Icons.watch),
    Product(name: 'Camera', description: 'DSLR camera for photography', price: '\$499', icon: Icons.camera_alt),
    Product(name: 'Tablet', description: '10-inch screen for drawing', price: '\$299', icon: Icons.tablet_mac),
    Product(name: 'Keyboard', description: 'Mechanical RGB keyboard', price: '\$89', icon: Icons.keyboard),
    Product(name: 'Speaker', description: 'Portable bluetooth speaker', price: '\$59', icon: Icons.speaker),
  ];

  // Function called when the Special Offer button is pressed
  void _onSpecialButtonClick() {
    setState(() {
      _buttonClickCount++;
    });
    
    // Showing a snackbar at the bottom
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Special Offer Button Clicked! Count: $_buttonClickCount'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Product Store'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Container for top controls and statistics
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Button 1: Special action button
                      ElevatedButton.icon(
                        onPressed: _onSpecialButtonClick,
                        icon: const Icon(Icons.star),
                        label: const Text('Special Offer'),
                      ),
                      // Button 2: Toggle view mode button
                      ElevatedButton.icon(
                        onPressed: () {
                          // Change the view state
                          setState(() {
                            _isGridView = !_isGridView;
                          });
                        },
                        icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
                        label: Text(_isGridView ? 'Show List' : 'Show Grid'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Text widget that updates on button clicks
                  Text(
                    'Special Offer clicked $_buttonClickCount times',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Scrollable List or Grid View
            // Expanded is necessary so that the list takes up remaining height without layout issues
            Expanded(
              child: _isGridView ? _buildGridView() : _buildListView(),
            ),
          ],
        ),
      ),
    );
  }

  // Builder function to build the ListView
  Widget _buildListView() {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6.0),
          elevation: 2.0,
          child: ListTile(
            leading: Icon(product.icon, color: Colors.blueAccent),
            title: Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(product.description),
            trailing: Text(
              product.price,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            // Tap handler for list items
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Selected Item: ${product.name}'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        );
      },
    );
  }

  // Builder function to build the GridView
  Widget _buildGridView() {
    return GridView.builder(
      itemCount: _products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns in the grid
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.95, // Width to height ratio of cards
      ),
      itemBuilder: (context, index) {
        final product = _products[index];
        return Card(
          elevation: 2.0,
          child: InkWell(
            // InkWell gives a nice ripple effect when tapping
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Selected Item: ${product.name}'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            borderRadius: BorderRadius.circular(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(product.icon, size: 40.0, color: Colors.blueAccent),
                  const SizedBox(height: 10.0),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 11.0, color: Colors.grey),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    product.price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
