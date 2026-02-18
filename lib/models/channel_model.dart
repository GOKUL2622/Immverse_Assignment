class ChannelModel {
  final String name;
  int unreadCount;
  String lastMessage;

  ChannelModel({
    required this.name,
    this.unreadCount = 0,
    this.lastMessage = "",
  });
}
