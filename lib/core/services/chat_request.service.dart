import 'package:get/get.dart';
import 'package:twinz/core/model/chat_request.dart';
import 'package:twinz/core/model/user.dart';
import 'package:twinz/core/repository/chat_request.repository.dart';

class ChatRequestService extends GetxService {
  final _repo = ChatRequestRepository();

  Future<String> sendRequestChat({required User toUser}) async {
    try {
      return await _repo.sendRequestChat(toUser: toUser);
    } catch (e) {
      rethrow;
    }
  }

  Future<int> acceptRequestChat({required ChatRequest chatRequest}) async {
    try {
      return await _repo.acceptRequestChat(chatRequest: chatRequest);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> rejectRequestChat({required ChatRequest chatRequest}) async {
    try {
      return await _repo.rejectRequestChat(chatRequest: chatRequest);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> cancelRequestChat({required ChatRequest chatRequest}) async {
    try {
      return await _repo.cancelRequestChat(chatRequest: chatRequest);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ChatRequest>> sentRequestChats() async {
    try {
      return await _repo.sentRequestChats();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ChatRequest>> receivedRequestChats() async {
    try {
      return await _repo.receivedRequestChats();
    } catch (e) {
      rethrow;
    }
  }
}
