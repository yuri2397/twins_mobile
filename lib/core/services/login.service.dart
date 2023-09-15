import 'package:get/get.dart';
import 'package:twins/core/repository/auth.repository.dart';
import 'package:twins/core/utils/utils.dart';

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

  logout() {}
}
