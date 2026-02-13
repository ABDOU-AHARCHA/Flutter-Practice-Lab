import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

@Preview(name: 'Cool Button')
Widget coolButtonPreview() {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            'Click Me!',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    ),
  );
}