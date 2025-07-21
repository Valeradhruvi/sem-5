import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:advance_flutter_lab/lab11/api_crud_controller.dart';

import 'api_crud_model.dart';

class Api_user_view extends StatelessWidget {
  final UserController controller = Get.put(UserController());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Crud')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by name or email',
                border: OutlineInputBorder(),
              ),
              onChanged: controller.search,
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.isError.value) {
                return Center(child: Text("Failed to load data"));
              } else if (controller.filteredList.isEmpty) {
                return Center(child: Text("No users found"));
              } else {
                return Obx(
                      () {
                  return ListView.builder(
                    itemCount: controller.filteredList.length,
                    itemBuilder: (context, index) {
                      final user = controller.filteredList[index];
                      return Card(
                        child: ListTile(
                          trailing: SizedBox(
                            width: 96,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    nameController.text = user.name;
                                    emailController.text = user.email;

                                    Get.defaultDialog(
                                      title: "Edit User",
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(controller: nameController),
                                          SizedBox(height: 20),
                                          TextFormField(controller: emailController),
                                        ],
                                      ),
                                      onConfirm: () {
                                        controller.updateData(
                                          User(
                                            id: user.id,
                                            name: nameController.text,
                                            email: emailController.text,
                                          ),
                                        );
                                        Get.back();
                                        Get.snackbar("User Edit", "User Updated successfully", backgroundColor: Colors.teal , snackPosition: SnackPosition.BOTTOM);
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.deleteData(user.id!);
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                          title: Text(user.name),
                          subtitle: Text(user.email),
                        ),

                      );
                    },
                  );
                },);
              }
            }),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
            title: "Add User",
            content: Column(
              children: [
                TextFormField(
                  controller: nameController,
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: emailController,
                )
              ],
            ),

            textConfirm: BTN_TEXT_YES,
            textCancel: BTN_TEXT_NO,
            onConfirm: () {
              controller.addData(User(id: "1", name: nameController.text, email: emailController.text));
              Get.back();
              Get.snackbar(
                  "User Add",
                  "User Added successfully",
                  backgroundColor: Colors.teal,
                  snackPosition: SnackPosition.BOTTOM
              );

            },
              onCancel: () {
                Get.back();
              },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
