import 'package:advance_flutter_lab/lab9/program_1/student_controller.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class StudentGetView2 extends StatelessWidget {
  final StudentGetController controller = StudentGetController();

  StudentGetView2({super.key}){
    Get.put(controller);
  }

  RxList<Map<String,dynamic>>? studentList;
  int? selectedId;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    studentList = (await controller.getAllStudent()) as RxList<Map<String, dynamic>>?;
    // setState(() {});
  }

  Future<void> _addStudent() async {
    if (nameController.text.isEmpty || ageController.text.isEmpty) {
      // Optionally show error
      return;
    }
    await controller.addStudent({
      STUDENT_NAMEE: nameController.text,
      STUDENT_AGE: ageController.text,
      STUDENT_EMAIL: "test@gmail.com",
      STUDENT_NUMBER: "1234567890",
      STUDENT_CITY: "City",
      STUDENT_STATE: "State",
      STUDENT_CPI: "8.5",
      STUDENT_10TH_GRADE: "85%",
      STUDENT_12TH_GRADE: "87%",
    });
    nameController.clear();
    ageController.clear();
    await _loadStudents();
  }

  Future<void> _updateStudent() async {
    if (selectedId == null || nameController.text.isEmpty || ageController.text.isEmpty) {
      return;
    }

    await controller.editGetStudent(selectedId!, {
      STUDENT_NAME: nameController.text,
      STUDENT_AGE: ageController.text,
    });

    nameController.clear();
    ageController.clear();
    selectedId = null;
    await _loadStudents();
  }

  Future<void> _deleteStudent(int id) async {
    await controller.deleteStudent(id);
    await _loadStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APPBAR_TITLE_OF_STUDENT_VIEW),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration:  InputDecoration(labelText: "Student Name"),
            ),
            TextField(
              controller: ageController,
              decoration:  InputDecoration(labelText: "Student Age"),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: selectedId == null ? _addStudent : _updateStudent,
              child: Text(selectedId == null ? "Add Student" : "UpdateStudent"),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: studentList!.length,
                  itemBuilder: (_, index) {
                    var student = studentList![index];
                    return ListTile(
                      onTap: () {
                        nameController.text = student[STUDENT_NAME];
                        ageController.text = student[STUDENT_AGE];
                        selectedId = student[STUDENT_ID];
                      },
                      title: Text(student[STUDENT_NAMEE]),
                      subtitle: Text("Age: ${student[STUDENT_AGE]}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _deleteStudent(student[STUDENT_ID]);
                        },
                      ),
                    );
                  },
                );
              },),
            ),
          ],
        ),
      ),
    );
  }
}
