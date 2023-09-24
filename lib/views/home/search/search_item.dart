import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twins/core/model/user.dart';
import 'package:twins/shared/utils/colors.dart';

// ignore: must_be_immutable
class SearchItemWidget extends StatefulWidget {
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
  State<SearchItemWidget> createState() => _SearchItemWidgetState();
}

class _SearchItemWidgetState extends State<SearchItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(2, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * .45,
            width: Get.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                (widget.user.profilePhoto != null && widget.user.profilePhoto != "") ? widget.user.profilePhoto! : "https://img.freepik.com/photos-gratuite/jeune-femme-chien-sans-abri-au-parc-photo-haute-qualite_144627-75703.jpg?w=740&t=st=1694874615~exp=1694875215~hmac=eb6804b67c1fc7b677babff8be1caaee8f4b47db541f6cfeb548f472371d555d",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "${widget.user.fullName}",
            overflow: TextOverflow.fade,
            style: const TextStyle(
              color: DARK_COLOR,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: Get.width,
            height: 60,
            child: Text(widget.user.bio ?? 'Bio',
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                maxLines: 2,
                style: TextStyle(color: Colors.black.withOpacity(0.4))),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => widget.cancel(),
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
                    color: DARK_COLOR,
                    size: 40,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => widget.like(),
                child: Container(
                  padding: const EdgeInsets.all(8),
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
                  child: const Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => widget.swipBack(),
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
                    Icons.redo,
                    color: Colors.pink,
                    size: 20,
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
