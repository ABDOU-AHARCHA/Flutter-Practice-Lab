import 'package:flutter/material.dart';
import 'package:testing_hot_reload/pages/product_detail_page.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body: Column(
        children: [
          _buildFilterBar(context),
          Expanded(
            child: _buildProductGrid(context),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildFilterOption('Sort', Icons.sort, context),
          _buildFilterOption('Filter', Icons.filter_list, context),
        ],
      ),
    );
  }

  Widget _buildFilterOption(String title, IconData icon, BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.black54),
        SizedBox(width: 8.0),
        Text(title, style: TextStyle(fontSize: 16.0)),
      ],
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.70,
      ),
      itemCount: 12, // More products for the shop page
      itemBuilder: (context, index) {
        final productName = 'Product ${index + 1}';
        return _buildProductCard(productName, (15.99 + index * 6).toStringAsFixed(2), context);
      },
    );
  }

  Widget _buildProductCard(String name, String price, BuildContext context) {
    return Card(
      elevation: 4.0,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(productName: name),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.grey[200],
                child: const Center(
                  child: Icon(Icons.photo_size_select_actual_outlined, size: 60, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
              child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('\$$price', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 16)),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.add_shopping_cart_outlined, color: Colors.white, size: 18,),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
