import 'package:get/get.dart';
import 'package:twinz/core/http/http_client.dart';
import 'package:twinz/core/model/notification.dart' as nt;

class NotificationRepository {
  final _client = Get.find<HttpClient>();

  Future<List<nt.Notification>> index() async {
    try {
      var response = await _client.get("/notifications");
      if (response.statusCode! <= 200 && response.statusCode! < 300) {
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
}
