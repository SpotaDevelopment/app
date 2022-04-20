import 'dart:convert';

class ChatMessage {
  String? messageContent;
  String? senderId;
  String? recipientId;
  String? groupChat;
  ChatMessage({
    required this.messageContent,
    required this.senderId,
    required this.recipientId,
    required this.groupChat,
  });

  ChatMessage copyWith({
    String? messageContent,
    String? senderId,
    String? recipientId,
    String? groupChat,
  }) {
    return ChatMessage(
      messageContent: messageContent ?? this.messageContent,
      senderId: senderId ?? this.senderId,
      recipientId: recipientId ?? this.recipientId,
      groupChat: groupChat ?? this.groupChat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'messageContent': messageContent,
      'senderId': senderId,
      'recipientId': recipientId,
      'groupChat': groupChat,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      messageContent: map['messageContent'],
      senderId: map['senderId'],
      recipientId: map['recipientId'],
      groupChat: map['groupChat'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) =>
      ChatMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatMessage(messageContent: $messageContent, senderId: $senderId, recipientId: $recipientId, groupChat: $groupChat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatMessage &&
        other.messageContent == messageContent &&
        other.senderId == senderId &&
        other.recipientId == recipientId &&
        other.groupChat == groupChat;
  }

  @override
  int get hashCode {
    return messageContent.hashCode ^
        senderId.hashCode ^
        recipientId.hashCode ^
        groupChat.hashCode;
  }
}
