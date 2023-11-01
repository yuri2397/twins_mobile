import 'package:get/get.dart';
import 'package:twinz/core/http/http_client.dart';
import 'package:twinz/core/model/notification.dart' as nt;
import 'package:twinz/core/model/user.dart';

class NotificationRepository {
  final _client = Get.find<HttpClient>();

  Future<List<nt.Notification>> index() async {
    try {
      var response = await _client.get("/notifications");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (response.data is Map) {
          return [];
        }
        return List<nt.Notification>.from(
            response.data.map((e) => nt.Notification.fromJson(e)));
      } else {
        throw "Oups! une erreur s'est produite.";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> markAsRead(String id) async {
    try {
      await _client.post("/notifications/mark-as-read/$id");
    } catch (e) {
      rethrow;
    }
  }

  Future<void> markAllRead() async {
    try {
      await _client.post("/notifications/mark-all-as-read");
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteNotification(int id) async{
    try {
      var response = await _client.delete("/notifications/$id}");
      return response.statusCode == 200;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> countUnread() async {
    try {
      var response = await _client.get("/notifications/count-unread");
      print(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return UnRead.fromJson(response.data).count ?? 0;
      }
      return 0;
    } catch (e) {
      rethrow;
    }
  }
}
