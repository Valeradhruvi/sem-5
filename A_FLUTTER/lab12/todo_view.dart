import 'package:advance_flutter_lab/lab12/api_repo.dart';
import 'package:advance_flutter_lab/lab12/todo_controller.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: const Text('📝 TO DO LIST'),
        backgroundColor: const Color(0xFF344f77),
        elevation: 4,
      ),
      body: GetX<TodoController>(
        init: TodoController(ApiRepo())..gettodo(),
        builder: (todocontroller) {
          if (todocontroller.todoList.isEmpty) {
            return const Center(child: Text("No tasks found."));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: todocontroller.todoList.length,
            itemBuilder: (context, index) {
              final item = todocontroller.todoList[index];
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  contentPadding: const EdgeInsets.all(16),
                  onTap: () {
                    Get.dialog(
                      AlertDialog(
                        title: const Text('✏️ Edit Todo'),
                        content: todocontroller.buildForm(id: item.id),
                      ),
                    );
                  },
                  title: Text(
                    item.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text(
                    item.desc,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () async {
                      await todocontroller.delettodo(item);
                      await todocontroller.gettodo();
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final controller = Get.find<TodoController>();
          Get.dialog(
            AlertDialog(
              title: const Text('➕ Add Todo'),
              content: controller.buildForm(id: null),
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Task"),
        backgroundColor: const Color(0xFF344f77),
      ),
    );
  }
}
