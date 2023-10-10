import 'package:get/get.dart';
import 'package:twinz/core/http/http_client.dart';
import 'package:twinz/core/model/init_payment.dart';
import 'package:twinz/core/model/notification.dart' as nt;
import 'package:twinz/core/model/plan.dart';

class PaymentRepository {
  final _client = Get.find<HttpClient>();

  Future<List<Plan>> index() async {
    try {
      var response = await _client.get("/plans");
      if (response.statusCode == 200) {
        return List<Plan>.from(
            response.data.map((e) => Plan.fromJson(e)));
      } else {
        throw "Oups! une erreur s'est produite.";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<InitPayment> initPayment(String id) async {
    try {
     var response =  await _client.get("/payment/init", params: {
        'plan_id': id
      });

     if(response.statusCode == 200){
       return InitPayment.fromJson(response.data);
     }else{
       throw response.data;
     }
    } catch (e) {
      rethrow;
    }
  }
}
