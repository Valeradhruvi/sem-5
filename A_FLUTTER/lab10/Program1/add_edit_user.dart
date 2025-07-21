import 'package:advance_flutter_lab/lab10/Program1/user_controller.dart';
import 'package:get/get.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';

class AddEditUser extends StatelessWidget {
  AddEditUser({super.key});


  UserController userModuleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              Color(0xFF2980B9),
              Color(0xFF6DD5FA),
            ],),
          ),
        ),
        title: Text(APPBAR_TITLE_OF_ADD_PRODUCT_PAGE),
        centerTitle: true,
      ),

      body: Form(
        key: userModuleController.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: userModuleController.nameController,
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () async {
                  await userModuleController.addUserToList(
                    name: userModuleController.nameController.text.trim(),
                  );
                  Get.back();
                },
                child: Text(BTN_TEXT_YES),
              ),
            ],
          )),
    );
  }
}
