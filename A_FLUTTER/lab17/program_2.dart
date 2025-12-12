import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final double screenWidth = MediaQuery.of(context).size.width;

    // Check condition (width > 700 ? WEB : Mobile)
    final bool isWeb = screenWidth > 1280;
    final bool isTab = screenWidth > 704;

    return Scaffold(
      backgroundColor: isWeb ? Colors.blue : Colors.green,
      body: Container(
        color: isWeb? Colors.indigoAccent : isTab ? Colors.purpleAccent : Colors.yellow,
        child: Center(
          child: Text(
            isWeb ? "WEB Screen" : isTab ? "Tab Screen" : "Mobile Screen",
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
