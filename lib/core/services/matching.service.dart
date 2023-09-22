import 'package:get/get.dart';
import 'package:twins/core/model/user.dart';
import 'package:twins/core/repository/matching.repository.dart';

class MatchingService extends GetxService {
  final _provider = MatchingRepository();

  Future<List<User>> matchings() async {
    try {
      return await _provider.matchings();
    } catch (e) {
      e.printError();
      rethrow;
    }
  }
}
