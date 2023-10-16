import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twinz/core/http/http_client.dart';
import 'package:twinz/core/model/setting.dart';
import 'package:twinz/core/model/token.dart';
import 'package:twinz/core/model/upload-file.dart';
import 'package:twinz/core/model/user.dart';
import 'package:twinz/core/utils/utils.dart';
import 'package:dio/dio.dart' as dio;

class AuthRepository {
  final _client = Get.find<HttpClient>();

  Future<Token> login(
      {required String username, required String password}) async {
    try {
      var response = await _client.post("/login", data: {
        "email": username,
        "password": password,
        "device_name": await deviceName,
        "device_id": await deviceId,
        "device_token": localStorage.getFcmToken()
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
      print(response.data);
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
      var response = await _client.put("/profile", data: data);
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
      {required Map<String, dynamic> data, required List<XFile> files}) async {
    var formData = dio.FormData.fromMap(data);
    List<String> images = [];
    List<dio.MultipartFile> multipartFiles = [];
    for (var file in files) {
      print("File path ---- ${file.path} -----");
      final bytes = File(file.path).readAsBytesSync();
      String b64 = base64Encode(bytes);
      images.add(b64);
      //print("Base64 ---- $b64 -----");

      var multipartFile =
          await dio.MultipartFile.fromFile(file.path, filename: file.name);
      multipartFiles.add(multipartFile);
      //formData.files.addAll([]);
      //formData.files.addAll(await dio.MultipartFile.fromFile('documents[]', file.path));
    }
    data.addAll({'photos': images});

    /*formData.files.addAll(files
        .map(
          (f) => MapEntry(
            'photos[]',
            dio.MultipartFile.fromFileSync(f.path, filename: f.name),
          ),
        )
        .toList());*/
    try {
      var response = await _client.post('/register',
          data: data,
          options: dio.Options(
              //contentType: 'multipart/form-data',
              ));

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        print(response.data);
        return Token.fromJson(response.data);
      } else {
        throw "ERREUR CATCH";
      }
    } catch (e) {
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

      for (var f in files) {
        print("${f.path}");
        formData.files.add(
            MapEntry('photos[]', await dio.MultipartFile.fromFile(f.path)));
      }

      var response = await _client.post("/photos",
          data: formData,
          options: dio.Options(contentType: 'multipart/form-data', headers: {
            "Accept": "application/json",
            'Authorization': 'Bearer ${localStorage.getToken()?.accessToken}'
          }));

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return List<UploadFile>.from(
            response.data.map((e) => UploadFile.fromJson(e)));
      } else {
        Get.log(response.data);
        throw "Impossible de modifier.";
      }
    } catch (e) {
      print("$e");
      rethrow;
    }
  }

  Future<List<UploadFile>> getPhotos() async {
    try {
      var response = await _client.get("/photos");
      if (response.statusCode! <= 200 && response.statusCode! < 300) {
        if (response.data is Map) {
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

  Future<List<UploadFile>> removePhoto(id) async {
    try {
      var response = await _client.get("/photos/$id");
      if (response.statusCode! <= 200 && response.statusCode! < 300) {
        if (response.data is Map) {
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
