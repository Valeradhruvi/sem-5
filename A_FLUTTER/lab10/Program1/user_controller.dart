import 'package:advance_flutter_lab/lab10/Program1/insert_database.dart';
import 'package:advance_flutter_lab/lab10/Program1/user_model.dart';
import 'package:advance_flutter_lab/lab10/Program1/user_repo.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  RxList<UserModel> userList = <UserModel>[].obs;
  GlobalKey<FormState> formKey = GlobalKey();
  var nameController = TextEditingController();
  UserRepo repository = UserRepo(InsertDatabase());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    repository.getAllUsers().then((value) {
      userList.addAll(value);
    },);
  }

  Future<void> addUserToList({required String name}) async {
    UserModel user = UserModel(userName: name);  // construct UserModel
    await repository.addUser("TBL_USER", user);  // insert into DB
    nameController.clear();                     // clear form
    userList.value = await repository.getAllUsers();  // refresh list
  }

  Future<void> updateUserToList({required String name, required int id}) async {
    UserModel updatedUser = UserModel(userName: name);
    await repository.updateUser("TBL_USER", updatedUser, id);
    nameController.clear();
    userList.value = await repository.getAllUsers();
  }

// Future<void> deleteUserFromList(int id) async{
  //   repository.de("TBL_USER", id);
  // }
}