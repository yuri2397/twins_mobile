import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:twins/core/model/chat.dart' as lc;
import 'package:twins/core/services/chat.service.dart';
import 'package:twins/core/utils/utils.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:twins/routes/router.dart';
import 'package:chatview/chatview.dart' as hc;

class ChatController extends GetxController {
  final messages = <hc.Message>[
    hc.Message(
      id: '1',
      message: "Hi!",
      createdAt: DateTime.now(),
      sendBy: '1', // userId of who sends the message
      status: hc.MessageStatus.read,
    ),
    hc.Message(
      id: '2',
      message: "Hi!",
      createdAt: DateTime.now(),
      sendBy: '2',
      status: hc.MessageStatus.read,
    ),
    hc.Message(
      id: '3',
      message: "We can meet?I am free",
      createdAt: DateTime.now(),
      sendBy: '1',
      status: hc.MessageStatus.read,
    ),
    hc.Message(
      id: '4',
      message: "Can you write the time and place of the meeting?",
      createdAt: DateTime.now(),
      sendBy: '1',
      status: hc.MessageStatus.read,
    ),
  ].obs;
  final types.User user = types.User(
    id: currentUserId,
  );
  final _localUser = localStorage.getUser();
  get localUser => _localUser;
  final chats = <lc.Chat>[].obs;
  final chatsLoad = false.obs;

  final _service = Get.find<ChatService>();

  final currentChat = lc.Chat().obs;

  final textFielController = TextEditingController();
  final hc.ChatController chatController = hc.ChatController(
    initialMessageList: [
      hc.Message(
        id: '1',
        message: "Hi!",
        createdAt: DateTime.now(),
        sendBy: '1', // userId of who sends the message
        status: hc.MessageStatus.read,
      ),
      hc.Message(
        id: '2',
        message: "Hi, how are.",
        createdAt: DateTime.now(),
        sendBy: '2',
        status: hc.MessageStatus.read,
      ),
      hc.Message(
        id: '3',
        message: "We can meet?I am free",
        createdAt: DateTime.now(),
        sendBy: '1',
        status: hc.MessageStatus.read,
      ),
      hc.Message(
        id: '4',
        message: "Can you write the time and place of the meeting?",
        createdAt: DateTime.now(),
        sendBy: '1',
        status: hc.MessageStatus.read,
      ),
    ],
    scrollController: ScrollController(),
    chatUsers: [
      hc.ChatUser(
          id: '2',
          name: 'Simform',
          profilePhoto:
              "http://twinz.cila3254.odns.fr/storage/39/09272023151414651446c66c5c1"),
      hc.ChatUser(
        id: '1',
        name: 'Jhon',
      ),
    ],
  );

  @override
  void onInit() {
    super.onInit();
    getChats();
  }

  Future<void> getChats() async {
    chatsLoad.value = true;
    _service.chats().then((value) {
      chats.value = value;
      chats.refresh();
      chatsLoad.value = false;
    }).catchError((e) {
      print("$e");
    });
  }

  detailsChat(lc.Chat chat) {
    chat.messages!.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    currentChat.value = chat;
    print(currentChat.value.toJson().toString());
    messages.value = chat.messages!
        .map((e) => hc.Message(
            id: "e",
            message: "",
            createdAt: chat.createdAt!,
            sendBy:
                "${chat.participants!.firstWhere((element) => element.id != int.tryParse(currentUserId)).id}"))
        .toList();
    Get.toNamed(Goo.chatScreen);
  }

  void addMessage() {
    messages.insert(
        0,
        hc.Message(
            id: "eaa",
            message: textFielController.text.trim(),
            createdAt: DateTime.now(),
            sendBy: currentUserId));
    messages.refresh();
    textFielController.text = "";
    chatController.addMessage(hc.Message(
        id: "eaa",
        message: textFielController.text.trim(),
        createdAt: DateTime.now(),
        sendBy: currentUserId));
  }

  void onSendTap(
    String message,
    hc.ReplyMessage replyMessage,
    hc.MessageType messageType,
  ) {
    final id = int.parse(messages.last.id) + 1;
    chatController.addMessage(
      hc.Message(
        id: id.toString(),
        createdAt: DateTime.now(),
        message: message,
        sendBy: currentUserId,
        replyMessage: replyMessage,
        messageType: messageType,
      ),
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      chatController.initialMessageList.last.setStatus =
          hc.MessageStatus.undelivered;
    });
    Future.delayed(const Duration(seconds: 1), () {
      chatController.initialMessageList.last.setStatus = hc.MessageStatus.read;
    });
  }

  void onThemeIconTap() {
    // setState(() {
    //   if (isDarkTheme) {
    //     theme = LightTheme();
    //     isDarkTheme = false;
    //   } else {
    //     theme = DarkTheme();
    //     isDarkTheme = true;
    //   }
    // });
  }

  void handleSendPressed(types.PartialText message) {
    // final textMessage = types.TextMessage(
    //   author: _user,
    //   createdAt: DateTime.now().millisecondsSinceEpoch,
    //   id: const Uuid().v4(),
    //   text: message.text,
    // );

    // _addMessage(textMessage);
  }

  void handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    // final index = _messages.indexWhere((element) => element.id == message.id);
    // final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
    //   previewData: previewData,
    // );

    // setState(() {
    //   _messages[index] = updatedMessage;
    // });
  }

  void handleMessageTap(_, types.Message message) async {
    // if (message is types.FileMessage) {
    //   var localPath = message.uri;

    //   if (message.uri.startsWith('http')) {
    //     try {
    //       final index =
    //           _messages.indexWhere((element) => element.id == message.id);
    //       final updatedMessage =
    //           (_messages[index] as types.FileMessage).copyWith(
    //         isLoading: true,
    //       );

    //       setState(() {
    //         _messages[index] = updatedMessage;
    //       });

    //       final client = http.Client();
    //       final request = await client.get(Uri.parse(message.uri));
    //       final bytes = request.bodyBytes;
    //       final documentsDir = (await getApplicationDocumentsDirectory()).path;
    //       localPath = '$documentsDir/${message.name}';

    //       if (!File(localPath).existsSync()) {
    //         final file = File(localPath);
    //         await file.writeAsBytes(bytes);
    //       }
    //     } finally {
    //       final index =
    //           _messages.indexWhere((element) => element.id == message.id);
    //       final updatedMessage =
    //           (_messages[index] as types.FileMessage).copyWith(
    //         isLoading: null,
    //       );

    //       setState(() {
    //         _messages[index] = updatedMessage;
    //       });
    //     }
    //   }

    //   await OpenFilex.open(localPath);
  }

  moreInfo(int index) {}
}
