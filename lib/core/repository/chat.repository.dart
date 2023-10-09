import 'package:get/get.dart';
import 'package:twins/core/http/http_client.dart';
import 'package:twins/core/model/chat.dart';
import 'package:twins/core/model/user.dart';

class ChatRepository {
  final _client = Get.find<HttpClient>();

  Future<List<Chat>> chats() async {
    try {
      var response = await _client.get("/chat");

      if (response.statusCode! <= 200 && response.statusCode! < 300) {
        if (response.data is Map) {
          return [];
        }
        return List<Chat>.from(response.data.map((e) => Chat.fromJson(e)));
      } else {
        throw "Oups! une erreur s'est produite.";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Chat> chatDetails({required Chat chat}) async {
    try {
      var response = await _client.get("/chat/${chat.id}");

      if (response.statusCode! <= 200 && response.statusCode! < 300) {
        return Chat.fromJson(response.data);
      } else {
        throw "Oups! une erreur s'est produite.";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Chat> sendMessage(
      {required Chat chat, required String message}) async {
    try {
      var response = await _client.post("/chat/send-msg",
          data: {"chat_id": chat.id, "message": message});
      if (response.statusCode! <= 200 && response.statusCode! < 300) {
        return Chat.fromJson(response.data);
      } else {
        throw "Oups! une erreur s'est produite.";
      }
    } catch (e) {
      rethrow;
    }
  }
}
