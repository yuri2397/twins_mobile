import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twins/core/repository/auth.repository.dart';
import 'package:twins/core/utils/utils.dart';

class RegisterService extends GetxService {
  final repo = AuthRepository();

  Future<void> register(
      {required Map<String, dynamic> data, XFile? avatar, required List<XFile> files}) async {
    try {
      var response = await repo.register(data: data, file: avatar, files: files);
      localStorage.token = response;
      localStorage.user = response.user;
      localStorage.isAuth = true;
    } catch (e) {
      rethrow;
    }
  }
}
