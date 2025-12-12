import 'package:flutter/material.dart';

class AsyncDemoScreen extends StatefulWidget {
  @override
  _AsyncDemoScreenState createState() => _AsyncDemoScreenState();
}

class _AsyncDemoScreenState extends State<AsyncDemoScreen> {
  String result = 'Waiting...';

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    throw Exception('Network failure!');
  }

  void handleData() async {
    setState(() {
      result = 'Loading...';
    });

    try {
      String data = await fetchData();
      setState(() {
        result = data;
      });
    } catch (e) {
      setState(() {
        result = 'Error caught: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Async Exception Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result, style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleData,
              child: Text('Fetch Data'),
            ),
          ],
        ),
      ),
    );
  }
}
