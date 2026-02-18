import 'package:flutter/material.dart';
import 'package:immverse/models/channel_model.dart';
import 'package:immverse/models/message_model.dart';
import 'package:immverse/repositories/chat_repository.dart';

class ChannelViewModel extends ChangeNotifier {

  final ChatRepository _repository;


  ChannelViewModel(this._repository);

  List<ChannelModel> get channels => _repository.getChannels();


  int _activeChannelIndex = -1;


  int get activeChannelIndex => _activeChannelIndex;

  void setActiveChannel(int index) {
    _activeChannelIndex = index;
    if (index >= 0 && index < channels.length) {
      channels[index].unreadCount = 0;
    }
    notifyListeners();
  }

  List<MessageModel> getMessages(String channelName) {
    return _repository.getChannelMessages(channelName);
  }

  void sendMessage({
    required String channelName,
    required String content,
    required String senderName,
  }) {
    final message = MessageModel(
      sender: senderName.isNotEmpty ? senderName : "You",
      content: content,
      timestamp: DateTime.now(),
      isMe: true,
    );

    _repository.addChannelMessage(channelName, message);


    final channelIndex = channels.indexWhere((c) => c.name == channelName);
    if (channelIndex != -1) {
      channels[channelIndex].lastMessage = content;
    }

    notifyListeners();
  }
}
