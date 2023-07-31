import 'package:http/http.dart' as http;
import 'package:my_bloc_demo/models/user_model.dart';

class UserRepo {
  Future<List<UserModel>> getUsers() async {
    var res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (res.statusCode == 200) {
      return userModelFromJson(res.body.toString());
    } else {
      throw Exception("Failed to load products");
    }
  }
}