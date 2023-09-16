import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:twins/core/model/token.dart';

import '../model/user.dart';

class LocalStorageService extends GetxService {
  final _box = GetStorage("_twins");
  final _tokenKey = "_token";
  final _userKey = "_user";
  final _isAuthKey = "_isAuth";

  Future<LocalStorageService> init() async {
    return this;
  }

  set token(Token token) {
    _box.write(_tokenKey, token.toJson());
  }

  set isAuth(bool value) => _box.write(_isAuthKey, value);

  bool get isAuth =>
      _box.read(_isAuthKey) != null && _box.read<bool>(_isAuthKey) == true;

  Token? getToken() {
    var data = _box.read(_tokenKey);
    if (data != null) {
      return Token.fromJson(data);
    }
    return null;
  }

  set user(User? user) => _box.write(_userKey, user?.toJson());

  User? getUser() {
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
