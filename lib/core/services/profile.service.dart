import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twinz/core/model/setting.dart';
import 'package:twinz/core/model/upload-file.dart';
import 'package:twinz/core/model/user.dart';
import 'package:twinz/core/repository/auth.repository.dart';
import 'package:twinz/core/utils/utils.dart';

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

  Future<User> profileUpdate({required User data}) async {
    try {
      var response = await repo.profileUpdate(data.toJson());
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

  Future<User> updateProfilePhoto(XFile file) async {
    try {
      return await repo.updatePhotoProfile(file);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UploadFile>> addPhotos(List<XFile> files) async {
    files.forEach((element) {
      print("$element");
    });
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

  Future<List<UploadFile>> removePhoto(id) async {
    try {
      var response = await repo.removePhoto(id);
      localStorage.photos = response;
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
