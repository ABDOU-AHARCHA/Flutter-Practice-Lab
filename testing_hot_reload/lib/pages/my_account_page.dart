import 'package:flutter/material.dart';
import 'package:testing_hot_reload/pages/account/order_history_page.dart';
import 'package:testing_hot_reload/pages/account/track_orders_page.dart';
import 'package:testing_hot_reload/pages/account/returns_page.dart';
import 'package:testing_hot_reload/pages/account/edit_profile_page.dart';
import 'package:testing_hot_reload/pages/account/shipping_addresses_page.dart';
import 'package:testing_hot_reload/pages/account/payment_methods_page.dart';
import 'package:testing_hot_reload/pages/account/change_password_page.dart';

class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildProfileHeader(context),
            const SizedBox(height: 24.0),
            _buildAccountMenu(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      color: Colors.white,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.deepPurple,
            child: Text(
              'JD',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          const SizedBox(width: 24.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'john.doe@example.com',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAccountMenu(BuildContext context) {
    return Column(
      children: [
        _buildMenuSectionHeader('My Orders'),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            children: [
              _buildMenuListItem('Order History', Icons.history_outlined, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistoryPage()));
              }),
              _buildMenuListItem('Track Orders', Icons.local_shipping_outlined, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TrackOrdersPage()));
              }),
              _buildMenuListItem('Returns', Icons.assignment_return_outlined, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReturnsPage()));
              }),
            ],
          ),
        ),
        const SizedBox(height: 24.0),
        _buildMenuSectionHeader('Account Settings'),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            children: [
              _buildMenuListItem('Edit Profile', Icons.person_outline, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
              }),
              _buildMenuListItem('Shipping Addresses', Icons.location_on_outlined, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShippingAddressesPage()));
              }),
              _buildMenuListItem('Payment Methods', Icons.payment_outlined, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethodsPage()));
              }),
              _buildMenuListItem('Change Password', Icons.lock_outline, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordPage()));
              }),
            ],
          ),
        ),
         const SizedBox(height: 24.0),
      ],
    );
  }

  Widget _buildMenuSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Colors.grey[600],
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
      ),
    );
  }

  Widget _buildMenuListItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16.0),
      onTap: onTap,
    );
  }
}
