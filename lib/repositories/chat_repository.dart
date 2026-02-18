import 'package:immverse/models/channel_model.dart';
import 'package:immverse/models/message_model.dart';
import 'package:immverse/models/user_model.dart';

class ChatRepository {
  final List<ChannelModel> _channels = [
    ChannelModel(name: "General", unreadCount: 5, lastMessage: "Hey everyone!"),
    ChannelModel(name: "Flutter Tips", unreadCount: 0, lastMessage: "Use Riverpod for state..."),
    ChannelModel(name: "Design Systems", unreadCount: 12, lastMessage: "New Figma kit is out!"),
    ChannelModel(name: "Random", unreadCount: 0, lastMessage: "Look at this cat video"),
    ChannelModel(name: "Project Immverse", unreadCount: 3, lastMessage: "Meeting at 4 PM"),
  ];

  List<ChannelModel> getChannels() => _channels;

  final Map<String, List<MessageModel>> _channelMessages = {};

  List<MessageModel> getChannelMessages(String channelName) {
    if (!_channelMessages.containsKey(channelName)) {
      _channelMessages[channelName] = _seedChannelMessages(channelName);
    }
    return _channelMessages[channelName]!;
  }

  void addChannelMessage(String channelName, MessageModel message) {
    getChannelMessages(channelName).add(message);
  }

  List<MessageModel> _seedChannelMessages(String channelName) {
    final now = DateTime.now();
    return [
      MessageModel(
        sender: "Gokul",
        content: "Hey everyone! Welcome to #$channelName 🎉",
        timestamp: now.subtract(const Duration(hours: 3, minutes: 20)),
      ),
      MessageModel(
        sender: "Rohit",
        content: "Thanks Gokul! Excited to be here.",
        timestamp: now.subtract(const Duration(hours: 3, minutes: 15)),
      ),
      MessageModel(
        sender: "You",
        content: "Hello! Happy to join this channel.",
        timestamp: now.subtract(const Duration(hours: 2, minutes: 50)),
        isMe: true,
      ),
      MessageModel(
        sender: "Varad",
        content: "Does anyone have ideas for this week's topic?",
        timestamp: now.subtract(const Duration(hours: 2, minutes: 10)),
      ),
      MessageModel(
        sender: "Gokul",
        content: "I was thinking we could discuss the latest Flutter updates.",
        timestamp: now.subtract(const Duration(hours: 1, minutes: 45)),
      ),
      MessageModel(
        sender: "You",
        content: "That sounds great! I've been exploring the new features.",
        timestamp: now.subtract(const Duration(hours: 1, minutes: 30)),
        isMe: true,
      ),
      MessageModel(
        sender: "Rohit",
        content: "Count me in! I'll share some code samples.",
        timestamp: now.subtract(const Duration(minutes: 55)),
      ),
      MessageModel(
        sender: "Madhav",
        content: "Hey all, just joined! What did I miss?",
        timestamp: now.subtract(const Duration(minutes: 20)),
      ),
    ];
  }

  final List<UserModel> _dmUsers = [
    UserModel(name: "Gokul", isOnline: true, lastSeen: "Online"),
    UserModel(name: "Rohit", isOnline: true, lastSeen: "Online"),
    UserModel(name: "Varad", isOnline: false, lastSeen: "2 hrs ago"),
    UserModel(name: "Madhav", isOnline: false, lastSeen: "30 min ago"),
  ];

  List<UserModel> getDmUsers() => _dmUsers;

  final Map<String, List<MessageModel>> _dmMessages = {};

  List<MessageModel> getDmMessages(String userName) {
    if (!_dmMessages.containsKey(userName)) {
      _dmMessages[userName] = _seedDmMessages(userName);
    }
    return _dmMessages[userName]!;
  }

  void addDmMessage(String userName, MessageModel message) {
    getDmMessages(userName).add(message);
  }

  List<MessageModel> _seedDmMessages(String userName) {
    final now = DateTime.now();
    return [
      MessageModel(
        sender: userName,
        content: "Hey! How are you doing?",
        timestamp: now.subtract(const Duration(hours: 2, minutes: 30)),
      ),
      MessageModel(
        sender: "You",
        content: "Hey! I'm doing great, thanks for asking 😊",
        timestamp: now.subtract(const Duration(hours: 2, minutes: 25)),
        isMe: true,
      ),
      MessageModel(
        sender: userName,
        content: "Awesome! Have you seen the latest project update?",
        timestamp: now.subtract(const Duration(hours: 2, minutes: 10)),
      ),
      MessageModel(
        sender: "You",
        content: "Not yet! What's new?",
        timestamp: now.subtract(const Duration(hours: 2)),
        isMe: true,
      ),
      MessageModel(
        sender: userName,
        content: "We've added some really cool features. Let me share the details with you.",
        timestamp: now.subtract(const Duration(hours: 1, minutes: 45)),
      ),
      MessageModel(
        sender: "You",
        content: "Sounds exciting! Please go ahead.",
        timestamp: now.subtract(const Duration(hours: 1, minutes: 30)),
        isMe: true,
      ),
    ];
  }
}
