import 'package:flutter/material.dart';

class ShippingAddressesPage extends StatelessWidget {
  // Dummy data for saved addresses
  final List<Map<String, dynamic>> addresses = [
    {
      'name': 'John Doe',
      'address': '123 Main St, Anytown, USA 12345',
      'isDefault': true,
    },
    {
      'name': 'John Doe',
      'address': '456 Oak Ave, Work City, USA 67890',
      'isDefault': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipping Addresses'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          return _buildAddressCard(addresses[index], context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add new address page
        },
        child: Icon(Icons.add),
        tooltip: 'Add New Address',
      ),
    );
  }

  Widget _buildAddressCard(Map<String, dynamic> address, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(address['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                if (address['isDefault'])
                  Chip(
                    label: Text('Default', style: TextStyle(color: Colors.white, fontSize: 12)),
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                  ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(address['address'], style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit_outlined, color: Colors.blueGrey),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline, color: Colors.redAccent),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
