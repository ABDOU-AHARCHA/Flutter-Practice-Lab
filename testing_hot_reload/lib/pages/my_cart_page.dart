import 'package:flutter/material.dart';

class MyCartPage extends StatelessWidget {
  // Dummy data
  final List<Map<String, dynamic>> cartItems = [
    {'name': 'Product 1', 'price': 25.99, 'quantity': 1, 'image': ''},
    {'name': 'Product 3', 'price': 39.99, 'quantity': 2, 'image': ''},
    {'name': 'Product 5', 'price': 55.99, 'quantity': 1, 'image': ''},
  ];

  @override
  Widget build(BuildContext context) {
    double subtotal = cartItems.fold(0, (sum, item) => sum + item['price'] * item['quantity']);
    double shipping = 5.99;
    double total = subtotal + shipping;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return _buildCartItem(cartItems[index], context);
              },
            ),
          ),
          _buildSummaryCard(subtotal, shipping, total, context),
        ],
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(Icons.photo_size_select_actual_outlined, color: Colors.grey, size: 40),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 4.0),
                  Text('\$${item['price'].toStringAsFixed(2)}', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(icon: Icon(Icons.remove_circle_outline), onPressed: () {}),
                Text(item['quantity'].toString(), style: TextStyle(fontSize: 16)),
                IconButton(icon: Icon(Icons.add_circle_outline), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(double subtotal, double shipping, double total, BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Order Summary', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal'),
                Text('\$${subtotal.toStringAsFixed(2)}'),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping'),
                Text('\$${shipping.toStringAsFixed(2)}'),
              ],
            ),
            Divider(height: 24.0, thickness: 1.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text('\$${total.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).primaryColor)),
              ],
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('Proceed to Checkout'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
