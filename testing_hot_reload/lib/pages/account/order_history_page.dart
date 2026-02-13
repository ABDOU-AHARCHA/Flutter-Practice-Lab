import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  // Dummy data
  final List<Map<String, dynamic>> orders = [
    {'id': '#3456', 'date': '2024-07-20', 'status': 'Delivered', 'total': 75.98},
    {'id': '#3392', 'date': '2024-07-15', 'status': 'Delivered', 'total': 120.50},
    {'id': '#3210', 'date': '2024-06-28', 'status': 'Cancelled', 'total': 45.00},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return _buildOrderCard(orders[index], context);
        },
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order, BuildContext context) {
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
                Text('Order ${order['id']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('\$${order['total'].toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Theme.of(context).primaryColor)),
              ],
            ),
            SizedBox(height: 8.0),
            Text('Placed on ${order['date']}', style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusChip(order['status']),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('View Details'),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Theme.of(context).primaryColor),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color chipColor;
    String chipText = status;

    switch (status) {
      case 'Delivered':
        chipColor = Colors.green;
        break;
      case 'Cancelled':
        chipColor = Colors.red;
        break;
      default:
        chipColor = Colors.orange;
    }

    return Chip(
      label: Text(chipText, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      backgroundColor: chipColor,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
    );
  }
}
