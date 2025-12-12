import 'package:flutter/material.dart';
import 'package:get/get.dart';


// void main() {
//   runApp(const ScreenSizeApp());
// }
//
// class ScreenSizeApp extends StatelessWidget {
//   const ScreenSizeApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ScreenSizeExample(),
//     );
//   }
// }

class ScreenSizeExample extends StatelessWidget {
  const ScreenSizeExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get screen dimensions
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("MediaQuery Example"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Screen Width: $screenWidth",
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text("Screen Height: $screenHeight",
                style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
