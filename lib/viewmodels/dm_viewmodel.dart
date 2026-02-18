import 'package:flutter/material.dart';
import 'package:immverse/models/user_model.dart';
import 'package:immverse/models/message_model.dart';
import 'package:immverse/repositories/chat_repository.dart';

class DmViewModel extends ChangeNotifier {

  final ChatRepository _repository;


  DmViewModel(this._repository);

  List<UserModel> get users => _repository.getDmUsers();

  List<UserModel> searchUsers(String query) {
    if (query.isEmpty) return users;
    return users
        .where((u) => u.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<MessageModel> getMessages(String userName) {
    return _repository.getDmMessages(userName);
  }

  void sendMessage({
    required String userName,
    required String content,
    required String senderName,
  }) {
    final message = MessageModel(
      sender: senderName.isNotEmpty ? senderName : "You",
      content: content,
      timestamp: DateTime.now(),
      isMe: true,
    );

    _repository.addDmMessage(userName, message);
    notifyListeners();
  }
}
