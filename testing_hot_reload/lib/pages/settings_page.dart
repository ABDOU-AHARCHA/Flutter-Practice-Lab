import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _pushNotifications = true;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          _buildSectionHeader('Notifications'),
          _buildNotificationSettings(context),
          const SizedBox(height: 24.0),
          _buildSectionHeader('Appearance'),
          _buildAppearanceSettings(context),
          const SizedBox(height: 24.0),
          _buildSectionHeader('Regional'),
          _buildRegionalSettings(context),
          const SizedBox(height: 24.0),
          _buildSectionHeader('Legal'),
          _buildLegalSettings(context),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
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

  Widget _buildNotificationSettings(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: SwitchListTile(
        title: Text('Push Notifications'),
        subtitle: Text('Receive updates on orders and promotions'),
        value: _pushNotifications,
        onChanged: (bool value) {
          setState(() {
            _pushNotifications = value;
          });
        },
        activeColor: Colors.deepPurple,
      ),
    );
  }

  Widget _buildAppearanceSettings(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: SwitchListTile(
        title: Text('Dark Mode'),
        subtitle: Text('Enable a dark theme for the app'),
        value: _darkMode,
        onChanged: (bool value) {
          setState(() {
            _darkMode = value;
          });
        },
         activeColor: Colors.deepPurple,
      ),
    );
  }

  Widget _buildRegionalSettings(BuildContext context) {
    return Card(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          ListTile(
            title: Text('Language'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('English', style: TextStyle(color: Colors.grey[600])),
                const SizedBox(width: 8.0),
                const Icon(Icons.arrow_forward_ios, size: 16.0),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Currency'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('USD', style: TextStyle(color: Colors.grey[600])),
                const SizedBox(width: 8.0),
                const Icon(Icons.arrow_forward_ios, size: 16.0),
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildLegalSettings(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          ListTile(
            title: Text('Terms of Service'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16.0),
            onTap: () {},
          ),
          ListTile(
            title: Text('Privacy Policy'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16.0),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
