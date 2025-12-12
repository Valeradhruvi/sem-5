import 'package:flutter/material.dart';

// Define a custom exception
class InvalidUserInputException implements Exception {
  final String message;
  InvalidUserInputException(this.message);

  @override
  String toString() => "InvalidUserInputException: $message";
}

class CustomExceptionScreen extends StatefulWidget {
  @override
  _CustomExceptionScreenState createState() => _CustomExceptionScreenState();
}

class _CustomExceptionScreenState extends State<CustomExceptionScreen> {
  String result = 'Waiting...';

  // 🌐 Simulate logic that throws a custom exception
  Future<void> validateInput(String userInput) async {
    await Future.delayed(Duration(seconds: 1));
    if (userInput != 'flutter') {
      throw InvalidUserInputException('Only "flutter" is accepted!');
    }
  }

  void handleValidation() async {
    setState(() {
      result = 'Validating...';
    });

    try {
      await validateInput('flutter');
      setState(() {
        result = 'Input is valid!';
      });
    } catch (e) {
      setState(() {
        result = 'Caught Exception: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Exception Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result, style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleValidation,
              child: Text('Validate Input'),
            ),
          ],
        ),
      ),
    );
  }
}
