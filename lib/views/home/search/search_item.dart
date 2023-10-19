import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twinz/core/model/user.dart';
import 'package:twinz/shared/utils/colors.dart';
import 'package:twinz/controllers/search.controller.dart' as sc;

// ignore: must_be_immutable
class SearchItemWidget extends StatelessWidget {
  User user;
  SearchItemWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * .65,
            width: Get.width,
            child: Stack(
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () =>
                        Get.find<sc.SearchController>().searchDetails(user),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        (user.profilePhoto != null && user.profilePhoto != "")
                            ? user.profilePhoto!
                            : "https://img.freepik.com/photos-gratuite/jeune-femme-chien-sans-abri-au-parc-photo-haute-qualite_144627-75703.jpg?w=740&t=st=1694874615~exp=1694875215~hmac=eb6804b67c1fc7b677babff8be1caaee8f4b47db541f6cfeb548f472371d555d",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () =>
                        Get.find<sc.SearchController>().searchDetails(user),
                    child: const Icon(
                      CupertinoIcons.info,
                      color: MAIN_COLOR,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(1),
                          ],
                        ),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${user.fullName}, ${user.age}".capitalizeFirst ??
                                  "",
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(
                              width: Get.width,
                              child: Text(
                                  DateFormat.MMMMd('fr')
                                      .format(user.birthDate ?? DateTime.now()),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.fade,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: Get.width,
                              height: 60,
                              child: Text(user.bio ?? 'Bio',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: const TextStyle(color: Colors.white)),
                            ),
                          ]),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
