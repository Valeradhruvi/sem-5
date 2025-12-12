import 'package:http/http.dart' as http;
abstract class ApiTodo{
  Future<http.Response> getData({data});

  Future<http.Response> addData({data});

  Future<http.Response> updateData({data});

  Future<http.Response> deleteData({data});

}