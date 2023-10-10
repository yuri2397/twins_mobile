import 'package:get/get.dart';
import 'package:twinz/core/model/user.dart';
import 'package:twinz/core/repository/matching.repository.dart';

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

  Future<User> matchingDetails({required User user}) async {
    try {
      return await _provider.matchingDetails(user);
    } catch (e) {
      e.printError();
      rethrow;
    }
  }
}
