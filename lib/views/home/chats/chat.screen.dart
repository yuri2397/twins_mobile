import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twins/controllers/chat.controller.dart' as lc;
import 'package:twins/core/utils/utils.dart';
import 'package:twins/shared/utils/colors.dart';
import 'package:chatview/chatview.dart' as hc;

class ChatScreen extends GetView<lc.ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            backgroundColor: MAIN_COLOR,
            elevation: 0,
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
            actions: [
              PopupMenuButton<int>(
                color: Colors.white,
                onSelected: (item) => controller.moreInfo(item),
                itemBuilder: (context) => [
                  const PopupMenuItem<int>(
                      value: 0, child: Text('Voir le profil')),
                  const PopupMenuItem<int>(value: 1, child: Text('Bloquer')),
                  const PopupMenuItem<int>(value: 2, child: Text('Signaler')),
                ],
              )
            ],
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(25),
                child: Text(
                    "${controller.currentChat.value.participants?.firstWhere((e) => e.id.toString() != currentUserId).fullName}",
                    style: const TextStyle(color: Colors.white, fontSize: 16))),
            title: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                  "${controller.currentChat.value.participants?.firstWhere((e) => e.id.toString() != currentUserId).profilePhoto}",
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill),
            )),
        body: ChatView(
          currentUser:
              hc.ChatUser(id: currentUserId, name: controller.localUser.fullName),
          chatController: controller.chatController,
          onSendTap: controller.onSendTap,
          featureActiveConfig: const FeatureActiveConfig(
            lastSeenAgoBuilderVisibility: true,
            receiptsBuilderVisibility: true,
            enableCurrentUserProfileAvatar: false,
            enableOtherUserProfileAvatar: true,
          ),
          chatViewState:controller.currentChat.value.messages!.isNotEmpty ? ChatViewState.hasMessages : ChatViewState.noData,
          chatViewStateConfig: ChatViewStateConfiguration(
            loadingWidgetConfig: const ChatViewStateWidgetConfiguration(
              loadingIndicatorColor: MAIN_COLOR,
            ),
            onReloadButtonTap: () {},
          ),
          typeIndicatorConfig: const TypeIndicatorConfiguration(
            flashingCircleBrightColor: MAIN_COLOR,
            flashingCircleDarkColor: Colors.white,
          ),
          chatBackgroundConfig: const ChatBackgroundConfiguration(
            messageTimeIconColor: MAIN_COLOR,
            messageTimeTextStyle: TextStyle(color: DARK_COLOR),
            defaultGroupSeparatorConfig: DefaultGroupSeparatorConfiguration(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            backgroundColor: Colors.white,
          ),
          sendMessageConfig: SendMessageConfiguration(
            imagePickerIconsConfig: const ImagePickerIconsConfiguration(
              cameraIconColor: Colors.white,
              galleryIconColor: Colors.white,
            ),
            replyMessageColor: MAIN_COLOR,
            defaultSendButtonColor: MAIN_COLOR,
            replyDialogColor: MAIN_COLOR,
            replyTitleColor: MAIN_COLOR,
            enableCameraImagePicker: false,
            enableGalleryImagePicker: false,
            allowRecordingVoice: false,
            textFieldBackgroundColor: NEUTRAL_COLOR,
            closeIconColor: Colors.pink,
            textFieldConfig: TextFieldConfiguration(
              borderRadius: BorderRadius.circular(20),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(6),
              onMessageTyping: (status) {
                /// Do with status
                debugPrint(status.toString());
              },
              compositionThresholdTime: const Duration(seconds: 1),
              hintText: "Rédigez votre message",
              textStyle: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            micIconColor: MAIN_COLOR,
            // voiceRecordingConfiguration: VoiceRecordingConfiguration(
            //   backgroundColor: MAIN_COLOR,
            //   recorderIconColor: MAIN_COLOR,
            //   waveStyle: WaveStyle(
            //     showMiddleLine: false,
            //     waveColor: Colors.white,
            //     extendWaveform: true,
            //   ),
            // ),
          ),
          chatBubbleConfig: ChatBubbleConfiguration(
            receiptsWidgetConfig: const ReceiptsWidgetConfig(
                showReceiptsIn: ShowReceiptsIn.all),
            outgoingChatBubbleConfig:const ChatBubble(
              linkPreviewConfig: LinkPreviewConfiguration(
                backgroundColor: NEUTRAL_COLOR,
              ),
              receiptsWidgetConfig:  ReceiptsWidgetConfig(
                  showReceiptsIn: ShowReceiptsIn.all),
              color: MAIN_COLOR,
            ),
            inComingChatBubbleConfig: ChatBubble(
              textStyle: const TextStyle(color: Colors.black),
              onMessageRead: (message) {
                /// send your message reciepts to the other client
                debugPrint('Message Read');
              },
              senderNameTextStyle: const TextStyle(color: Colors.white),
              color: NEUTRAL_COLOR,
            ),
          ),
          replyPopupConfig:const ReplyPopupConfiguration(
            backgroundColor: MAIN_COLOR,
            buttonTextStyle: TextStyle(color: MAIN_COLOR),
            topBorderColor: MAIN_COLOR,
          ),
          reactionPopupConfig: ReactionPopupConfiguration(
            shadow: BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 20,
            ),
            backgroundColor: MAIN_COLOR,
          ),
          messageConfig: MessageConfiguration(
            messageReactionConfig: MessageReactionConfiguration(
              backgroundColor: Colors.orange,
              borderColor: Colors.red,
              borderWidth: 4,
              reactedUserCountTextStyle:const TextStyle(color: MAIN_COLOR),
              reactionCountTextStyle:const TextStyle(color: MAIN_COLOR),
              reactionsBottomSheetConfig: ReactionsBottomSheetConfiguration(
                backgroundColor: MAIN_COLOR,
                reactedUserTextStyle:const TextStyle(
                  color: MAIN_COLOR,
                ),
                reactionWidgetDecoration: BoxDecoration(
                  color: MAIN_COLOR,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: const Offset(0, 20),
                      blurRadius: 40,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            imageMessageConfig: ImageMessageConfiguration(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              shareIconConfig: ShareIconConfiguration(
                defaultIconBackgroundColor: MAIN_COLOR,
                defaultIconColor: MAIN_COLOR,
              ),
            ),
          ),
          swipeToReplyConfig:const SwipeToReplyConfiguration(
            replyIconColor: Colors.amberAccent,
          ),
        ),
      );

  _emptyState() {
    return Center(
        child: Container(
      width: Get.width,
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.all(Get.width * .15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 100,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/images/empty_chat.svg",
            width: 80,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Commencez une nouvelle conversation !",
            textAlign: TextAlign.center,
          )
        ],
      ),
    ));
  }

  Widget _buildMessage(message, messageWidth) {
    return Container();
  }

  void _showHideTypingIndicator() {
    controller.chatController.setTypingIndicator =
        !controller.chatController.showTypingIndicator;
  }
}
