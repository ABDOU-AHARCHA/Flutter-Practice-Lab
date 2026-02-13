import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildPasswordTextField(_currentPasswordController, 'Current Password', _obscureCurrentPassword, () {
                setState(() {
                  _obscureCurrentPassword = !_obscureCurrentPassword;
                });
              }),
              SizedBox(height: 16.0),
              _buildPasswordTextField(_newPasswordController, 'New Password', _obscureNewPassword, () {
                 setState(() {
                  _obscureNewPassword = !_obscureNewPassword;
                });
              }),
              SizedBox(height: 16.0),
              _buildPasswordTextField(_confirmPasswordController, 'Confirm New Password', _obscureConfirmPassword, () {
                 setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              }, (value) {
                 if (value != _newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
              }),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform password change
                     ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Password changed successfully')),
                    );
                  }
                },
                child: Text('Change Password'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField(TextEditingController controller, String label, bool obscureText, VoidCallback toggleVisibility, [String? Function(String?)? validator]) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          ),
          onPressed: toggleVisibility,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        if(validator != null) {
          return validator(value);
        }
        return null;
      },
    );
  }
}
