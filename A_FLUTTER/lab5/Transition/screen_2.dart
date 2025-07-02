import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen B")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Back to Screen A"),
        ),
      ),
    );
  }
}