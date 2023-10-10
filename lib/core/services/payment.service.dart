import 'package:get/get.dart';
import 'package:twinz/core/model/init_payment.dart';
import 'package:twinz/core/model/plan.dart';
import 'package:twinz/core/repository/payment.repository.dart';

class PaymentService extends GetxService{
  final _repo = PaymentRepository();

  Future<List<Plan>> index() async{
    try{
      return await _repo.index();
    }
    catch(e){
      print("$e");
      rethrow;
    }
  }

  Future<InitPayment> initPayment(String planId) async{
    try{
      return await _repo.initPayment(planId);
    }catch(e){
      rethrow;
    }
  }
}