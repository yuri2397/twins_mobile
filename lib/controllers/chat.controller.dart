import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:twins/core/utils/utils.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatController extends GetxController {
  final List<types.Message> messages = List<dynamic>.from([
    {
      "author": {
        "createdAt": 1678992000,
        "firstName": "John",
        "id": "1",
        "imageUrl": "https://example.com/john.jpg",
        "lastName": "Doe",
        "lastSeen": 1679004600,
        "metadata": {"key1": "value1", "key2": "value2"},
        "updatedAt": 1679006400
      },
      "createdAt": 1678996200,
      "id": "1",
      "metadata": {"key1": "value1", "key2": "value2"},
      "remoteId": "remote001",
      "roomId": "101",
      "showStatus": true,
      "status": "sent",
      "text": "Bonjour tout le monde",
      "type": "text",
      "updatedAt": 1678998300
    },
    {
      "author": {
        "createdAt": 1678993800,
        "firstName": "Jane",
        "id": "2",
        "imageUrl": "https://example.com/jane.jpg",
        "lastName": "Doe",
        "lastSeen": 1679005500,
        "metadata": {"key3": "value3", "key4": "value4"},
        "updatedAt": 1679009700
      },
      "createdAt": 1678998900,
      "id": "2",
      "metadata": {"key3": "value3", "key4": "value4"},
      "remoteId": "remote002",
      "text": "Bonjour tout le monde",
      "roomId": "102",
      "showStatus": true,
      "status": "delivered",
      "type": "text",
      "updatedAt": 1679001000
    },
    {
      "author": {
        "createdAt": 1678990800,
        "firstName": "Alex",
        "id": "3",
        "imageUrl": "https://example.com/alex.jpg",
        "lastName": "Smith",
        "lastSeen": 1679002800,
        "metadata": {"key5": "value5", "key6": "value6"},
        "updatedAt": 1679004600
      },
      "createdAt": 1679001600,
      "id": "3",
      "metadata": {"key5": "value5", "key6": "value6"},
      "remoteId": "remote003",
      "repliedMessage": {"id": "4", "text": "Salut !"},
      "roomId": "103",
      "text": "Bonjour tout le monde",
      "showStatus": false,
      "status": "read",
      "type": "text",
      "updatedAt": 1679003700
    },
    {
      "author": {
        "createdAt": 1678992000,
        "firstName": "Bob",
        "id": "4",
        "imageUrl": "https://example.com/bob.jpg",
        "lastName": "Johnson",
        "lastSeen": 1679005500,
        "metadata": {"key7": "value7", "key8": "value8"},
        "updatedAt": 1679010000
      },
      "createdAt": 1679003100,
      "id": "4",
      "metadata": {"key7": "value7", "key8": "value8"},
      "remoteId": "remote004",
      "roomId": "104",
      "showStatus": true,
      "text": "Bonjour tout le monde",
      "status": "sent",
      "type": "text",
      "updatedAt": 1679005200
    },
    {
      "author": {
        "createdAt": 1678995600,
        "firstName": "Emma",
        "id": "5",
        "imageUrl": "https://example.com/emma.jpg",
        "lastName": "Brown",
        "lastSeen": 1679006400,
        "metadata": {"key9": "value9", "key10": "value10"},
        "updatedAt": 1679011800
      },
      "createdAt": 1679009400,
      "id": "5",
      "metadata": {"key9": "value9", "key10": "value10"},
      "remoteId": "remote005",
      "roomId": "105",
      "showStatus": true,
      "status": "sent",
      "type": "text",
      "text": "Bonjour tout le monde",
      "updatedAt": 1679012700
    }
  ]).map((e) => types.Message.fromJson(e)).toList();
  final types.User user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  void addMessage(types.Message message) {}

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
}
