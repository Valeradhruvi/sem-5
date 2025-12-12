import 'dart:convert';

import 'package:advance_flutter_lab/lab12/api_services.dart';
// import 'package:advance_flutter_lab/lab%2012/api_services.dart';
import 'package:advance_flutter_lab/lab12/todo_model.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:http/http.dart' as http;

class TodoController extends GetxController{
  ApiTodo? apiTodo;
  TodoController(this.apiTodo);
  TextEditingController titlecontroller=TextEditingController();
  TextEditingController desccontroller=TextEditingController();
  RxList<ToDoModel> todoList  = <ToDoModel>[].obs;

  Future<void> addtodo(ToDoModel model) async {
    final res = await apiTodo!.addData(data: model.toMap());
    if (res.statusCode == 201 || res.statusCode == 200) {
      gettodo();
    } else {
      print("Failed to add: ${res.statusCode}");
    }
  }


  // Future<void> gettodo() async {
  //     http.Response response = await apiTodo!.getData();
  //
  //     if (response.statusCode == 200) {
  //       List data = jsonDecode(response.body);
  //       for (var element in data) {
  //         todoList.add(
  //           ToDoModel(
  //             id: element['id'],
  //             title: element['title'],
  //             desc: element['desc'],
  //           ),
  //         );
  //       }
  //
  //     }
  // }


  Future<void> gettodo() async {
    http.Response response = await apiTodo!.getData();
    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      todoList.value = jsonData.map((e) => ToDoModel.fromMap(e)).toList();
    }
  }


  Future<void> edittodo(ToDoModel model) async {
    await apiTodo!.updateData(data: model.toMap());
  }
  Future<void> delettodo(ToDoModel model) async {
    await apiTodo!.deleteData(data: model.toMap());
  }

  Widget buildForm({String? id}) {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    // Pre-fill for edit
    if (id != null) {
      final item = todoList.firstWhere((e) => e.id == id);
      titleController.text = item.title;
      descController.text = item.desc;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: titleController,
          decoration: InputDecoration(labelText: 'Title'),
        ),
        TextField(
          controller: descController,
          decoration: InputDecoration(labelText: 'Description'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            ToDoModel model = ToDoModel(
              id: id,
              title: titleController.text,
              desc: descController.text,
            );

            if (id == null) {
              await addtodo(model);
            } else {
              await edittodo(model);
            }

            await gettodo(); // refresh
            Get.back(); // close dialog
          },
          child: Text(id == null ? 'Add' : 'Update'),
        )
      ],
    );
  }



}