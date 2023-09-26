import 'package:get/get.dart';
import 'package:twins/core/model/user.dart';
import 'package:twins/core/utils/utils.dart';

class UserService extends GetxService {
  Future<User> updateUser(User user) async {
    return localStorage.getUser() ?? User(id: int.tryParse(currentUserId) ?? -1);
  }
}
