import 'package:get/get.dart';
import 'package:twins/core/http/http_client.dart';
import 'package:twins/core/model/user.dart';

class MatchingRepository {
  final _client = Get.find<HttpClient>();

  Future<List<User>> matchings() async {
    var response = await _client.get("/matchings");
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      return List.from(response.data).map((e) => User.fromJson(e)).toList();
    }

    throw response.data;
  }
}
