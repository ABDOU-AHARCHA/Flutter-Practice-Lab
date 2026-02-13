import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatelessWidget {
  // Dummy data for saved payment methods
  final List<Map<String, dynamic>> paymentMethods = [
    {
      'brand': 'Visa',
      'last4': '1234',
      'isDefault': true,
    },
    {
      'brand': 'Mastercard',
      'last4': '5678',
      'isDefault': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Methods'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) {
          return _buildPaymentMethodCard(paymentMethods[index], context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add new payment method page
        },
        child: Icon(Icons.add),
        tooltip: 'Add New Payment Method',
      ),
    );
  }

  Widget _buildPaymentMethodCard(Map<String, dynamic> method, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Icon(_getCardIcon(method['brand']), size: 40, color: Colors.black54),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${method['brand']} ending in ${method['last4']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  if (method['isDefault'])
                    Text('Default', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12)),
                ],
              ),
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                // Handle menu selection
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                if (!method['isDefault'])
                  const PopupMenuItem<String>(
                    value: 'setDefault',
                    child: Text('Set as Default'),
                  ),
                const PopupMenuItem<String>(
                  value: 'remove',
                  child: Text('Remove'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCardIcon(String brand) {
    switch (brand) {
      case 'Visa':
        return Icons.credit_card;
      case 'Mastercard':
        return Icons.credit_card;
      default:
        return Icons.credit_card;
    }
  }
}
