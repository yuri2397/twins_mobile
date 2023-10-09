import 'package:get/get.dart';
import 'package:twins/core/repository/notification.repository.dart';
import 'package:twins/core/model/notification.dart' as nt;

class NotificationService extends GetxService {
  final _repo = NotificationRepository();

  Future<List<nt.Notification>> index() async {
    try {
      return _repo.index();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> markAsRead({required String id}) async {
    try {
      return _repo.markAsRead(id);
    } catch (e) {
      rethrow;
    }
  }
}
