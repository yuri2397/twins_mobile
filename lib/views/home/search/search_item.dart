import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twins/components/ui.dart';
import 'package:twins/core/config/env.dart';
import 'package:twins/core/model/user.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

// ignore: must_be_immutable
class SearchItemWidget extends StatelessWidget {
  User user;
  Function cancel;
  Function like;
  Function swipBack;
  SearchItemWidget(
      {super.key,
      required this.user,
      required this.cancel,
      required this.like,
      required this.swipBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Align(
          //         alignment: Alignment.topRight,
          //         child: itemIcon(CupertinoIcons.info_circle_fill))
          //     .marginOnly(bottom: 12),
          SizedBox(
            height: Get.height * .45,
            width: Get.width,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      (user.profilePhoto != null &&
                              user.profilePhoto != "")
                          ? user.profilePhoto!
                          : "https://img.freepik.com/photos-gratuite/jeune-femme-chien-sans-abri-au-parc-photo-haute-qualite_144627-75703.jpg?w=740&t=st=1694874615~exp=1694875215~hmac=eb6804b67c1fc7b677babff8be1caaee8f4b47db541f6cfeb548f472371d555d",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Goo.searchDetailsScreen),
                    child: itemIcon(CupertinoIcons.info_circle_fill),
                  ),
                ),

              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${user.fullName}, ${user.age}".capitalizeFirst ?? "",
            overflow: TextOverflow.fade,
            style: const TextStyle(
              color: DARK_COLOR,
              fontWeight: FontWeight.w700,
              fontSize: 22,
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
                style: TextStyle(
                    color: Colors.black.withOpacity(0.4), fontSize: 18)),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: Get.width,
            height: 60,
            child: Text(
                user.bio ??
                    'Bio ===================================================================================================',
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(color: Colors.black.withOpacity(0.5))),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => cancel(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 20,
                        offset:
                            const Offset(2, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.pink,
                    size: 35,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => swipBack(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 20,
                        offset:
                            const Offset(2, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                  ),
                  child: const Icon(
                    Icons.undo,
                    color: Colors.yellowAccent,
                    size: 25,
                  ),
                ),
              ).marginOnly(top: 10),
              GestureDetector(
                onTap: () => like(),
                child: Container(
                  decoration: BoxDecoration(
                    color: MAIN_COLOR,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 20,
                        offset:
                            const Offset(2, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Image.asset(
                    Env.whiteLogo,
                    width: 50,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
