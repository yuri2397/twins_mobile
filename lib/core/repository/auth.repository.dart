import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twins/components/ui.dart';
import 'package:twins/core/http/http_client.dart';
import 'package:twins/core/model/setting.dart';
import 'package:twins/core/model/token.dart';
import 'package:twins/core/model/upload-file.dart';
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

  Future<void> resendLink() async {
    try {
      await _client.get(
        "/verify/resend",
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<User> profile() async {
    try {
      var response = await _client.get("/profile");
      if (response.statusCode! <= 200 && response.statusCode! < 300) {
        return User.fromJson(response.data);
      } else {
        Get.log(response.data);
        throw "Impossible récuperer votre profil.";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User> profileUpdate(Map<String, dynamic> data) async {
    try {
      var response = await _client.post("/profile", data: data);
      if (response.statusCode! <= 200 && response.statusCode! < 300) {
        return User.fromJson(response.data);
      } else {
        Get.log(response.data);
        throw "Impossible de modifier vos informations.";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User> updateSettings(Setting settings) async {
    try {
      var response = await _client.post("/settings", data: settings.toJson());
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

  Future<void> logout() async {
    await _client.post("/logout", data: {});
  }

  Future<Token> register(
      {required Map<String, dynamic> data, XFile? file}) async {
    try {
      dio.FormData formData = dio.FormData.fromMap({
        ...data,
        'profile_photo':
            await dio.MultipartFile.fromFile(file!.path, filename: file.name)
      });

      var response = await _client.post('/register',
          data: formData,
          options: dio.Options(contentType: 'multipart/form-data', headers: {
            'Authorization': 'Bearer ${localStorage.getToken()?.accessToken}'
          }));

      /*var response = await _client.post(
        '/register',
        data: data,
      );*/

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return Token.fromJson(response.data);
      } else {
        throw "ERREUR CATCH";
      }
    } catch (e, s) {
      Get.log("$e");
      rethrow;
    }
  }

  Future<User> updatePhotoProfile(XFile file) async {
    try {
      var response = await _client.post("/profile-photo",
          data: dio.FormData.fromMap({
            'profile_photo':
                await dio.MultipartFile.fromFile(file.path, filename: file.name)
          }),
          options: dio.Options(contentType: 'multipart/form-data', headers: {
            'Authorization': 'Bearer ${localStorage.getToken()?.accessToken}'
          }));

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return User.fromJson(response.data);
      } else {
        throw "Upload fail";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UploadFile>> addPhoto(List<XFile> files) async {
    try {
      dio.FormData formData = dio.FormData.fromMap({});

      for (var file in files) {
        formData.files.add(
            MapEntry('photos[]', await dio.MultipartFile.fromFile(file.path)));
      }

      var response = await _client.post("/photos",
          data: formData,
          options: dio.Options(contentType: 'multipart/form-data'));
      log(response.data.toString());

      if (response.statusCode! <= 200 && response.statusCode! < 300) {
        return List<UploadFile>.from(
            response.data.map((e) => UploadFile.fromJson(e)));
      } else {
        Get.log(response.data);
        throw "Impossible de modifier.";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UploadFile>> getPhotos() async {
    try {
      var response = await _client.get("/photos");
      if (response.statusCode! <= 200 && response.statusCode! < 300) {
       if( response.data['success']){
         return [];
       }
        return List<UploadFile>.from(
            response.data.map((x) => UploadFile.fromJson(x)));
      } else {
        Get.log(response.data);
        throw "Impossible de récuperer les images.";
      }
    } catch (e) {
      rethrow;
    }
  }
}
