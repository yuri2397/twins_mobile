import 'package:get/get.dart';
import 'package:twins/core/model/setting.dart';
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

  Future<User> updateSettings(Setting settings) async{
    try {
      var response = await repo.updateSettings(settings);
      localStorage.settings = response.settings;
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async{

    try {
      return await repo.logout();
    } catch (e) {
      rethrow;
    }
  }
}
