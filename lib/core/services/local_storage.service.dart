import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:twins/core/model/token.dart';

import '../model/user.dart';

class LocalStorageService extends GetxService {
  final _box = GetStorage("_twins");
  final _tokenKey = "_token";
  final _userKey = "_user";

  set token(Token token) {
    _box.write(_tokenKey, token.toJson());
  }

  getToken() {
    var data = _box.read(_tokenKey);
    if (data != null) {
      return Token.fromJson(data);
    }
    return null;
  }

  set user(User? user) => _box.write(_userKey, user?.toJson());

  getUser() {
    var data = _box.read(_userKey);
    if (data != null) {
      return User.fromJson(data);
    }

    return null;
  }

  Future<void> clear() async {
    _box.erase();
  }
}
