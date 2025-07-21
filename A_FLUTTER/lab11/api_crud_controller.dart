import 'package:get/get.dart';
import 'package:advance_flutter_lab/lab11/api_crud_model.dart';
import 'package:advance_flutter_lab/lab11/api_service.dart';

class UserController extends GetxController {
  ApiService apiService = ApiService();
  var userList = <User>[].obs;
  var filteredList = <User>[].obs;
  var isLoading = true.obs;
  var isError = false.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      isError(false);
      var users = await apiService.fetchUsers();
      userList.assignAll(users);
      filteredList.assignAll(users);
    } catch (e) {
      isError(true);
    } finally {
      isLoading(false);
    }
  }

  void addData(User user) async{
    await apiService.addUsers(user);
    fetchData();
  }

  void updateData(User user)async{
    await apiService.updateUser(user);
    int index = filteredList.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      filteredList[index] = user;
      filteredList.refresh(); // Force update
    }
    fetchData();
  }

  void deleteData(String id) async{
    await apiService.deleteUser(id);
    filteredList.removeWhere((u) => u.id == id);
    fetchData();
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      filteredList.assignAll(userList);
    } else {
      filteredList.assignAll(
        userList.where((user) =>
        user.name.toLowerCase().contains(keyword.toLowerCase()) ||
            user.email.toLowerCase().contains(keyword.toLowerCase())),
      );
    }
  }
}
