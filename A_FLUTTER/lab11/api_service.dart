import 'dart:convert';
import 'package:advance_flutter_lab/lab11/api_crud_model.dart';
import 'package:http/http.dart' as http;


class ApiService {
  final baseUrl = "https://66718917e083e62ee43c0012.mockapi.io/users";
  Future<List<User>> fetchUsers() async {


    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }

  Future<void> addUsers(User user) async{
    final response = await http.post(
        Uri.parse(baseUrl) ,
        body: user.toMap()
    );
  }

  Future<void> deleteUser(String id) async{
    var res = await http.delete((Uri.parse("$baseUrl/$id")));
  }

  Future<void> updateUser(User user) async{
    var res = await http.put(
       Uri.parse("$baseUrl/${user.id}"),
        body: user.toMap()
    );
  }
}
