import 'package:flutter/material.dart';

class ReturnsPage extends StatelessWidget {
  // Dummy data for past returns
  final List<Map<String, dynamic>> pastReturns = [
    {
      'orderId': '#3210',
      'item': 'Product 4',
      'date': '2024-07-01',
      'status': 'Refunded',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Returns'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Initiate a New Return'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 24.0),
            Text('Past Returns', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: pastReturns.length,
                itemBuilder: (context, index) {
                  return _buildReturnCard(pastReturns[index], context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReturnCard(Map<String, dynamic> item, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${item['item']} (Order ${item['orderId']})', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 8.0),
            Text('Processed on ${item['date']}', style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: _buildStatusChip(item['status']),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    return Chip(
      label: Text(status, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      backgroundColor: Colors.blueGrey,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
    );
  }
}
