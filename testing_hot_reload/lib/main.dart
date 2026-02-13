import 'package:flutter/material.dart';
import 'package:testing_hot_reload/pages/shop_page.dart';
import 'package:testing_hot_reload/pages/categories_page.dart';
import 'package:testing_hot_reload/pages/my_cart_page.dart';
import 'package:testing_hot_reload/pages/my_account_page.dart';
import 'package:testing_hot_reload/pages/settings_page.dart';

void main() => runApp(MaterialApp(
  home: ECommerceHome(),
  theme: ThemeData(

    primarySwatch: Colors.deepPurple,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(secondary: Colors.orangeAccent),
    scaffoldBackgroundColor: const Color(0xFFf5f5f7),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black87),
      titleTextStyle: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    ),
  ),
  debugShowCheckedModeBanner: false,
));

class ECommerceHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Store'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('john.doe@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'JD',
                  style: TextStyle(fontSize: 24.0, color: Colors.deepPurple),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.store_outlined),
              title: const Text('Shop'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShopPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.category_outlined),
              title: const Text('Categories'),
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart_outlined),
              title: const Text('My Cart'),
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => MyCartPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('My Account'),
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccountPage()));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildPromoBanner(context),
            _buildSectionHeader('Categories', context),
            _buildCategoryList(context),
            _buildSectionHeader('Featured Products', context),
            _buildProductGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoBanner(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.deepPurple, Colors.purpleAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Big Summer Sale!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          const Text(
            'Up to 50% off on selected items.',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Shop Now'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              )
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        children: <Widget>[
          _buildCategoryItem('Electronics', Icons.devices_other, context),
          _buildCategoryItem('Fashion', Icons.checkroom, context),
          _buildCategoryItem('Home', Icons.home_work, context),
          _buildCategoryItem('Books', Icons.menu_book, context),
          _buildCategoryItem('Sports', Icons.sports_soccer, context),
          _buildCategoryItem('Groceries', Icons.local_grocery_store, context),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(icon, size: 30, color: Theme.of(context).primaryColor),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.70,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return _buildProductCard('Product ${index + 1}', (25.99 + index * 7).toStringAsFixed(2), context);
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
        onTap: () {},
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
