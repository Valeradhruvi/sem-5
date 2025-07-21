import 'package:advance_flutter_lab/lab10/Program1/add_edit_user.dart';
import 'package:advance_flutter_lab/lab10/Program1/db_service.dart';
import 'package:advance_flutter_lab/lab10/Program1/insert_database.dart';
import 'package:advance_flutter_lab/lab10/Program1/user_controller.dart';
import 'package:advance_flutter_lab/lab10/Program1/user_model.dart';
import 'package:advance_flutter_lab/lab10/Program1/user_repo.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class UserView extends StatelessWidget {
  UserView({super.key});
  // UserController userModuleController = Get.find();


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
        title: Text(APPBAR_TITLE_OF_RX_LIST_VIEW),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Get.to(()=>AddEditUser());
          }, icon: Icon(Icons.add))
        ],
      ),
      body: GetX<UserController>(
        init: UserController(),
        builder: (controller) {
          return controller.userList.isNotEmpty?
          ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 3,
                  child: ListTile(
                    onTap: () {
                      // Pre-fill the text field BEFORE showing dialog
                      controller.nameController.text =
                          controller.userList[index].name;

                      Get.defaultDialog(
                        title: "Edit User",
                        content: Column(
                          children: [
                            TextFormField(
                              controller: controller.nameController,
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () async {
                              await controller.updateUserToList(
                                name: controller.nameController.text.trim(),
                                id: controller.userList[index].id,
                              );
                              Get.back();
                            },
                            child: Text(BTN_TEXT_YES),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(BTN_TEXT_NO),
                          )
                        ],
                      );
                    },
                    leading: CircleAvatar(
                      child: Text(controller.userList[index].name[0].toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white),),
                      backgroundColor: Colors.indigoAccent,
                    ),
                    trailing: IconButton(onPressed: () async{
                      await controller.repository.deleteUser("TBL_USER", controller.userList[index].id).then((value)async {
                        print("User deleted successfully");
                        controller.userList.value = await controller.repository.getAllUsers();
                      },);
                    }, icon: Icon(Icons.delete_forever , color: Colors.red,)
                    ),
                    title: Text(controller.userList[index].name.toUpperCase() , style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
              );
            },
            itemCount: controller.userList.length,
          )
          : Center(
            child: Text("No USer Found"),
          );
        },
      )
    );
  }
}
