import 'package:get/get.dart';
import 'package:twins/core/http/http_client.dart';
import 'package:twins/core/model/chat_request.dart';
import 'package:twins/core/model/user.dart';

class ChatRequestRepository {
  final _client = Get.find<HttpClient>();

  Future<String> sendRequestChat({required User toUser}) async {
    try {
      var response = await _client.post("/discussion-requests/sent/${toUser.id}", data: {});
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['success'];
      } else {
        throw response.statusMessage ?? "Oups, une erreur s'est produite." ;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> acceptRequestChat({required ChatRequest chatRequest}) async {
    try {
      var response = await _client.post("/discussion-requests/${chatRequest.id}/accept", data: {});
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['success'];
      } else {
        throw response.statusMessage ?? "Oups, une erreur s'est produite." ;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> rejectRequestChat({required ChatRequest chatRequest}) async {
    try {
      var response = await _client.post("/discussion-requests/${chatRequest.id}/reject", data: {});
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['success'];
      } else {
        throw response.statusMessage ?? "Oups, une erreur s'est produite." ;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> cancelRequestChat({required ChatRequest chatRequest}) async {
    try {
      var response = await _client.post("/discussion-requests/${chatRequest.id}/cancel", data: {});
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['success'];
      } else {
        throw response.statusMessage ?? "Oups, une erreur s'est produite." ;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ChatRequest>> sentRequestChats() async {
    try {
      var response = await _client.get("/discussion-requests/sent");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return  List<ChatRequest>.from(response.data.map((e) => ChatRequest.fromJson(e))).toList();
      } else {
        throw response.statusMessage ?? "Oups, une erreur s'est produite." ;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ChatRequest>> receivedRequestChats() async {
    try {
      var response = await _client.get("/discussion-requests/received");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return  List<ChatRequest>.from(response.data.map((e) => ChatRequest.fromJson(e))).toList();
      } else {
        throw response.statusMessage ?? "Oups, une erreur s'est produite." ;
      }
    } catch (e) {
      rethrow;
    }
  }
}
