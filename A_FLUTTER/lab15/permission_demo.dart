import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const CameraPermissionApp());
}

class CameraPermissionApp extends StatelessWidget {
  const CameraPermissionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Permission Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const CameraPermissionScreen(),
    );
  }
}

class CameraPermissionScreen extends StatefulWidget {
  const CameraPermissionScreen({super.key});

  @override
  State<CameraPermissionScreen> createState() => _CameraPermissionScreenState();
}

class _CameraPermissionScreenState extends State<CameraPermissionScreen> {
  String _permissionStatus = "Unknown";

  Future<void> _checkAndRequestPermission() async {
    var status = await Permission.camera.status;

    if (status.isGranted) {
      setState(() {
        _permissionStatus = "Camera permission already granted.";
      });
    } else if (status.isDenied) {
      PermissionStatus newStatus = await Permission.camera.request();
      setState(() {
        _permissionStatus = newStatus.isGranted
            ? "Camera permission granted now."
            : "Camera permission denied.";
      });
    } else if (status.isPermanentlyDenied) {
      setState(() {
        _permissionStatus = "Permission permanently denied. Please enable it from settings.";
      });
      openAppSettings(); // Opens device settings
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Camera Permission")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _permissionStatus,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkAndRequestPermission,
                child: const Text("Request Camera Permission"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
