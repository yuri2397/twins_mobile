import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twinz/core/repository/auth.repository.dart';
import 'package:twinz/core/utils/utils.dart';

class RegisterService extends GetxService {
  final repo = AuthRepository();

  Future<void> register(
      {required Map<String, dynamic> data, required List<XFile> files}) async {
    try {
      var response = await repo.register(data: data, files: files);
      localStorage.token = response;
      localStorage.user = response.user;
      localStorage.isAuth = true;
    } catch (e) {
      rethrow;
    }
  }

  // check email
  Future<bool> checkEmail({required String email}) async {
    try {
      return await repo.checkEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }
}
