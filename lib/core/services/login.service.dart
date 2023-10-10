import 'package:get/get.dart';
import 'package:twinz/core/repository/auth.repository.dart';
import 'package:twinz/core/utils/utils.dart';

class LoginService extends GetxService {
  final repo = AuthRepository();

  Future<void> login(
      {required String username, required String password}) async {
    try {
      var response = await repo.login(username: username, password: password);
      localStorage.token = response;
      localStorage.user = response.user;
      localStorage.isAuth = true;
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

  logout() async {
    await repo.logout();
  }
}
