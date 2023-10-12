import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:twinz/core/model/chat.dart';
import 'package:twinz/core/model/notification.dart' as not;
import 'package:twinz/core/model/setting.dart';
import 'package:twinz/core/model/token.dart';
import 'package:twinz/core/model/upload-file.dart';

import '../model/user.dart';

class LocalStorageService extends GetxService {
  final _box = GetStorage("_twins");
  final _tokenKey = "_token";
  final _userKey = "_user";
  final _isAuthKey = "_isAuth";
  final _settings = '_settings';
  final _photos = '_photos';
  final _authNotifications = '_authNotifications';
  final _fcmToken = '_fcmToken';
  final _swipIndex = "_swipIndex";
  final _notifications = "_notifications";
  final _messages = "_messages";

  Future<LocalStorageService> init() async {
    return this;
  }

  GetStorage get box => _box;

  set notifications(List<not.Notification> nots) {
    var res = nots.map((e) => e.toJson());
    _box.write(_notifications, res);
  }

  List<not.Notification> getNotifications() {
    var res = _box.read<dynamic>(_notifications);
    if (res != null) {
      return List<not.Notification>.from(
          res.map((e) => not.Notification.fromJson(e))).toList();
    }
    return [];
  }

  set messages(List<Chat> c) {
    var res = c.map((e) => e.toJson());
    _box.write(_messages, res);
  }

  List<Chat> getMessages() {
    var res = _box.read<dynamic>(_messages);
    if (res != null) {
      return List<Chat>.from(res.map((e) => Chat.fromJson(e))).toList();
    }
    return [];
  }

  set swipIndex(int value) => _box.write(_swipIndex, value);

  int getSwipIndex() => _box.read(_swipIndex) ?? 0;
  set fcmToken(String value) => _box.write(_fcmToken, value);

  getFcmToken() => _box.read(_fcmToken);

  set authNotification(bool value) => _box.write(_authNotifications, value);

  bool? getAuthNotification() => _box.read(_authNotifications);
  set token(Token token) {
    _box.write(_tokenKey, token.toJson());
  }

  set photos(List<UploadFile> photos) => _box.write(_photos, photos);

  List<UploadFile> getPhotos() => _box.read(_photos);

  set settings(Setting? settings) => _box.write(_settings, settings?.toJson());

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

  Setting? getSettings() {
    var data = _box.read(_settings);
    if (data != null) {
      return Setting.fromJson(data);
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
