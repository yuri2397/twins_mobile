import 'package:get/get.dart';
import 'package:twins/core/http/http_client.dart';
import 'package:twins/core/model/chat.dart';
import 'package:twins/core/model/user.dart';

class ChatRepository {
  final _client = Get.find<HttpClient>();

  Future<List<Chat>> chats() async {
    try {
      var response = await _client.get("/chat");
      print(response.data.toString());
      if (response.statusCode! <= 200 && response.statusCode! < 300) {
        if(response.data is Map){
          return  [];
        }
        return List<Chat>.from(response.data.map((e) => Chat.fromJson(e)));
      } else {
        throw "Oups! une erreur s'est produite.";
      }
    } catch (e) {

      rethrow;
    }
  }
}
