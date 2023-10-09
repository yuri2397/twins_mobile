import 'package:get/get.dart';
import 'package:twins/core/http/http_client.dart';
import 'package:twins/core/model/user.dart';

class MatchingRepository {
  final _client = Get.find<HttpClient>();

  Future<List<User>> matchings() async {
    var response = await _client.get("/matchings");
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      if (response.data is Map) {
        return [];
      }
      return List.from(response.data).map((e) => User.fromJson(e)).toList();
    }

    throw response.data;
  }

  matchingDetails(User user) async {
    var response = await _client.get("/matchings/${user.id}");
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      return User.fromJson(response.data);
    }

    throw response.data;
  }
}
