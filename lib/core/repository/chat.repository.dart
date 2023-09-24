import 'package:get/get.dart';
import 'package:twins/core/http/http_client.dart';
import 'package:twins/core/model/user.dart';

class ChatRepository {
  final _client = Get.find<HttpClient>();

  Future<User> update({required User user}) async {
    try {
      var response = await _client.post("/login", data: user.toJson());
      if (response.statusCode! <= 200 && response.statusCode! < 300) {
        return User.fromJson(response.data);
      } else {
        throw "Oups! une erreur s'est produite.";
      }
    } catch (e) {
      rethrow;
    }
  }
}
