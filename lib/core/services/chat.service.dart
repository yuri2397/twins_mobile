import 'package:get/get.dart';
import 'package:twins/core/model/chat.dart';
import 'package:twins/core/repository/chat.repository.dart';

class ChatService extends GetxService {
  final _repo = ChatRepository();

  Future<List<Chat>> chats() async{
    try{
      return await _repo.chats();
    }catch(e){
      rethrow;
    }
  }

  Future<void> sendMessage({ required Chat chat, required String message}) async{
    try{

    }catch(e){
      rethrow;
    }
  }
}
