import 'package:get/get.dart';
import 'package:twins/core/model/chat.dart';
import 'package:twins/core/repository/chat.repository.dart';

class ChatService extends GetxService {
  final _repo = ChatRepository();

  Future<List<Chat>> chats() async {
    try {
      return await _repo.chats();
    } catch (e) {
      rethrow;
    }
  }

  Future<Chat> chatDetails({required Chat chat}) async {
    try {
      return await _repo.chatDetails(chat: chat);
    } catch (e) {
      rethrow;
    }
  }

  Future<Chat> sendMessage(
      {required Chat chat, required String message}) async {
    try {
      return await _repo.sendMessage(chat: chat, message: message);
    } catch (e) {
      rethrow;
    }
  }
}
