import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen A")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/screenB');
          },
          child: const Text("Go to Screen B"),
        ),
      ),
    );
  }
}
