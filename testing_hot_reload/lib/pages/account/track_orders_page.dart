import 'package:flutter/material.dart';

class TrackOrdersPage extends StatelessWidget {
  // Dummy data for active orders
  final List<Map<String, dynamic>> activeOrders = [
    {
      'id': '#3480',
      'item': 'Product 8',
      'status': 'Shipped',
      'trackingNumber': 'XYZ123456789',
      'steps': ['Confirmed', 'Shipped', 'Out for Delivery', 'Delivered'],
      'currentStep': 2,
    },
    {
      'id': '#3481',
      'item': 'Product 2',
      'status': 'Confirmed',
      'trackingNumber': 'ABC987654321',
      'steps': ['Confirmed', 'Shipped', 'Out for Delivery', 'Delivered'],
      'currentStep': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Orders'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: activeOrders.length,
        itemBuilder: (context, index) {
          return _buildOrderTrackingCard(activeOrders[index], context);
        },
      ),
    );
  }

  Widget _buildOrderTrackingCard(Map<String, dynamic> order, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ${order['id']} - ${order['item']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 8.0),
            Text('Tracking #: ${order['trackingNumber']}', style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 24.0),
            _buildTrackingTimeline(order['steps'], order['currentStep'], context),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackingTimeline(List<String> steps, int currentStep, BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        return _buildTimelineStep(steps[index], index < currentStep, index == currentStep -1, index == steps.length - 1, context);
      }),
    );
  }

  Widget _buildTimelineStep(String title, bool isCompleted, bool isCurrent, bool isLast, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              isCompleted || isCurrent ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isCompleted || isCurrent ? Theme.of(context).primaryColor : Colors.grey,
              size: 24,
            ),
            if (!isLast)
              Container(
                height: 40,
                width: 2,
                color: isCompleted ? Theme.of(context).primaryColor : Colors.grey[300],
              ),
          ],
        ),
        SizedBox(width: 16.0),
        Padding(
          padding: const EdgeInsets.only(top: 2.0), // Adjust text position
          child: Text(title, style: TextStyle(fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal, fontSize: 16, color: isCurrent ? Colors.black : Colors.grey[700])),
        ),
      ],
    );
  }
}
