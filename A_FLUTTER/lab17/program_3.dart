import 'package:flutter/material.dart';

class ResponsivePaddingScreen extends StatelessWidget {
  const ResponsivePaddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final double screenWidth = MediaQuery.of(context).size.width;

    // Define responsive padding
    double paddingValue;
    if (screenWidth < 600) {
      paddingValue = 16.0; // Mobile
    } else if (screenWidth < 1000) {
      paddingValue = 32.0; // Tablet
    } else {
      paddingValue = 64.0; // Web / Desktop
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Padding"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
          color: Colors.deepPurpleAccent,
          padding: EdgeInsets.all(paddingValue),
          child: Text(
            "Screen Width: $screenWidth\nPadding: $paddingValue",
            style: const TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
