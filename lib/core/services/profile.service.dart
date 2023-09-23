import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twins/core/model/setting.dart';
import 'package:twins/core/model/upload-file.dart';
import 'package:twins/core/model/user.dart';
import 'package:twins/core/repository/auth.repository.dart';
import 'package:twins/core/utils/utils.dart';

class ProfileService extends GetxService {
  final repo = AuthRepository();

  Future<User> profile() async {
    try {
      var response = await repo.profile();
      localStorage.user = response;
      localStorage.settings = response.settings;
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> updateSettings(Setting settings) async {
    try {
      var response = await repo.updateSettings(settings);
      localStorage.settings = response.settings;
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      return await repo.logout();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resendLink() async {
    try {
      return await repo.resendLink();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UploadFile>> addPhotos(List<XFile> files) async {
    try {
      return await repo.addPhoto(files);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UploadFile>> getPhotos() async {
    try {
      var response = await repo.getPhotos();
      localStorage.photos = response;
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}