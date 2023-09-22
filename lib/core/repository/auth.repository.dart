import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twins/core/http/http_client.dart';
import 'package:twins/core/model/setting.dart';
import 'package:twins/core/model/token.dart';
import 'package:twins/core/model/user.dart';
import 'package:twins/core/utils/utils.dart';
import 'package:dio/dio.dart' as dio;

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

  Future<Token> register(
      {required Map<String, dynamic> data, XFile? avatar}) async {
    try {
      dio.FormData formData = dio.FormData.fromMap(data);

      if (avatar != null) {
        formData.files.addAll([
          MapEntry(
              'profile_photo', await dio.MultipartFile.fromFile(avatar.path)),
        ]);
      }

      var response = await _client.post('/register',
          data: formData,
          options: dio.Options(contentType: 'multipart/form-data'));

      if (response.statusCode! <= 200 && response.statusCode! < 300) {
        return Token.fromJson(response.data);
      } else {
        Get.log(response.data);
        throw "Email ou mot de passe invalide.";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User> profile() async {
    try {
       var response  = await _client.get("/profile");
       if (response.statusCode! <= 200 && response.statusCode! < 300) {
         return User.fromJson(response.data);
       } else {
         Get.log(response.data);
         throw "Impossible récuperer le profile.";
       }
    } catch (e) {
      rethrow;
    }
  }

  Future<User> updateSettings(Setting settings) async {
    try {
      var response  = await _client.post("/settings", data: settings.toJson());
      if (response.statusCode! <= 200 && response.statusCode! < 300) {
        return User.fromJson(response.data);
      } else {
        Get.log(response.data);
        throw "Impossible de modifier.";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async{
    await _client.post("/logout", data: {});
  }
}
