import 'package:get/get.dart';
import 'package:twins/core/model/zodiaque.dart';
import 'package:twins/core/services/local_storage.service.dart';

LocalStorageService get localStorage => Get.find<LocalStorageService>();

bool get isAuth => localStorage.getToken() != null;

void logout() {
  localStorage.clear();
}

SigneZodiaque determinerSigne(DateTime dateNaissance) {
  int jour = dateNaissance.day;
  int mois = dateNaissance.month;

  if ((mois == 3 && jour >= 21) || (mois == 4 && jour <= 20)) {
    return listeSignes.firstWhere((element) => element.nom == "Bélier");
  } else if ((mois == 4 && jour >= 21) || (mois == 5 && jour <= 20)) {
    return listeSignes.firstWhere((element) => element.nom == "Taureau");
  } else if ((mois == 5 && jour >= 21) || (mois == 6 && jour <= 20)) {
    return listeSignes.firstWhere((element) => element.nom == "Gémeaux");
  } else if ((mois == 6 && jour >= 21) || (mois == 7 && jour <= 23)) {
    return listeSignes.firstWhere((element) => element.nom == "Cancer");
  } else if ((mois == 7 && jour >= 24) || (mois == 8 && jour <= 23)) {
    return listeSignes.firstWhere((element) => element.nom == "Lion");
  } else if ((mois == 8 && jour >= 24) || (mois == 9 && jour <= 22)) {
    return listeSignes.firstWhere((element) => element.nom == "Vierge");
  } else if ((mois == 9 && jour >= 23) || (mois == 10 && jour <= 22)) {
    return listeSignes.firstWhere((element) => element.nom == "Balance");
  } else if ((mois == 10 && jour >= 23) || (mois == 11 && jour <= 21)) {
    return listeSignes.firstWhere((element) => element.nom == "Scorpion");
  } else if ((mois == 11 && jour >= 22) || (mois == 12 && jour <= 21)) {
    return listeSignes.firstWhere((element) => element.nom == "Sagittaire");
  } else if ((mois == 12 && jour >= 22) || (mois == 1 && jour <= 19)) {
    return listeSignes.firstWhere((element) => element.nom == "Capricorne");
  } else if ((mois == 1 && jour >= 20) || (mois == 2 && jour <= 18)) {
    return listeSignes.firstWhere((element) => element.nom == "Verseau");
  } else {
    return listeSignes.firstWhere((element) => element.nom == "Poissons");
  }
}
