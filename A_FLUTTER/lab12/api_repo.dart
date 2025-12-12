import 'package:advance_flutter_lab/lab12/api_services.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart' as http;
import 'package:advance_flutter_lab/utils/strings.dart';
class ApiRepo implements ApiTodo{
  @override
  Future<Response> addData({data}) async{
    return await http.post(Uri.parse(BASE_URL), body: data);
  }

  @override
  Future<Response> deleteData({data}) async{
    return await http.delete(Uri.parse('$BASE_URL/${data['id']}'));
  }

  @override
  Future<Response> getData({data}) async{
    return await http.get(Uri.parse(BASE_URL));
  }

  @override
  Future<http.Response> updateData({data}) async {
    return await http.put(
      Uri.parse('$BASE_URL/${data['id']}'),
      body: data,
    );
  }

}