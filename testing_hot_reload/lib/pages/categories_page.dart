import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Electronics', 'icon': Icons.devices_other},
    {'name': 'Fashion', 'icon': Icons.checkroom},
    {'name': 'Home', 'icon': Icons.home_work},
    {'name': 'Books', 'icon': Icons.menu_book},
    {'name': 'Sports', 'icon': Icons.sports_soccer},
    {'name': 'Groceries', 'icon': Icons.local_grocery_store},
    {'name': 'Health & Beauty', 'icon': Icons.healing},
    {'name': 'Toys & Games', 'icon': Icons.toys},
    {'name': 'Automotive', 'icon': Icons.directions_car},
    {'name': 'Garden & Outdoor', 'icon': Icons.local_florist},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 1.2,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryCard(categories[index]['name'], categories[index]['icon'], context);
        },
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, BuildContext context) {
    return Card(
      elevation: 4.0,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 40, color: Theme.of(context).primaryColor),
            SizedBox(height: 16),
            Text(title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
