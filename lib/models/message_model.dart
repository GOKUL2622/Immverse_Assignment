class MessageModel {
  final String sender;
  final String content;
  final DateTime timestamp;
  final bool isMe;

  MessageModel({
    required this.sender,
    required this.content,
    required this.timestamp,
    this.isMe = false,
  });
}
