import 'package:get/get.dart';
import 'package:twinz/core/repository/notification.repository.dart';
import 'package:twinz/core/model/notification.dart' as nt;

class NotificationService extends GetxService {
  final _repo = NotificationRepository();

  Future<List<nt.Notification>> index() async {
    try {
      return _repo.index();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> markAllRead() async{
    try{
      return await _repo.markAllRead();
    }catch(e){
      rethrow;
    }
  }

  Future<bool> deleteNotification(int id) async{
    try{
      return await _repo.deleteNotification(id);
    }catch(e){
      rethrow;
    }
  }

  Future<int> countUnread() async {
    try{
    return await _repo.countUnread();
    }catch(e){
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

  updateDeviceToken(token) {}
}
