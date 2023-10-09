import 'package:get/get.dart';
import 'package:twins/core/model/user.dart';
import 'package:twins/core/repository/user.repository.dart';
import 'package:twins/core/utils/utils.dart';

class UserService extends GetxService {
  final _repo = UserRepository();
  Future<User> updateUser(User user) async {
    return localStorage.getUser() ??
        User(id: int.tryParse(currentUserId) ?? -1);
  }

  Future<bool> blockUser({required User user}) async {
    try {
      return await _repo.blockUser(user: user);
    } catch (e) {
      print("$e");
      rethrow;
    }
  }

  Future<bool> reportUser({required User user}) async {
    try {
      return await _repo.reportUser(user: user);
    } catch (e) {
      print("$e");
      rethrow;
    }
  }

  Future<bool> unblockUser({required User user}) async {
    try {
      return await _repo.unblockUser(user: user);
    } catch (e) {
      print("$e");
      rethrow;
    }
  }

  Future<bool> enableAccount() async {
    try {
      return await _repo.enableAccount();
    } catch (e) {
      print("$e");
      rethrow;
    }
  }

  Future<bool> disableAccount() async {
    try {
      return await _repo.disableAccount();
    } catch (e) {
      print("$e");
      rethrow;
    }
  }
}
