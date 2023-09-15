import 'package:get/get.dart';
import 'package:twins/core/http/http_client.dart';
import 'package:twins/core/model/token.dart';
import 'package:twins/core/model/user.dart';
import 'package:twins/core/utils/utils.dart';

class AuthRepository {
  final _client = Get.find<HttpClient>();

  Future<Token> login(
      {required String username, required String password}) async {
    try {
      var response = await _client.post("/login", data: {
        "email": username,
        "password": password,
        "device_name": await deviceName
      });
      if (response.statusCode! <= 200 && response.statusCode! < 300) {
        return Token.fromJson(response.data);
      } else {
        throw "Email ou mot de passe invalide.";
      }
    } catch (e) {
      rethrow;
    }
  }

  // Future<Token> register({required Map<String, dynamic> data}) async {
  //   try {} catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<User> profile() async {
  //   try {} catch (e) {
  //     rethrow;
  //   }
  // }
}
