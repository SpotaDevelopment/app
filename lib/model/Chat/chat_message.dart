import 'dart:convert';

class ChatMessage {
  String? messageContent;
  String? senderId;
  String? recipientId;
  String? groupChat;
  String? chatTimeStamp;
  String? chatId;
  ChatMessage({
    this.messageContent,
    this.senderId,
    this.recipientId,
    this.groupChat,
    this.chatTimeStamp,
    this.chatId,
  });

  ChatMessage copyWith({
    String? messageContent,
    String? senderId,
    String? recipientId,
    String? groupChat,
    String? chatTimeStamp,
    String? chatId,
  }) {
    return ChatMessage(
      messageContent: messageContent ?? this.messageContent,
      senderId: senderId ?? this.senderId,
      recipientId: recipientId ?? this.recipientId,
      groupChat: groupChat ?? this.groupChat,
      chatTimeStamp: chatTimeStamp ?? this.chatTimeStamp,
      chatId: chatId ?? this.chatId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'messageContent': messageContent,
      'senderId': senderId,
      'recipientId': recipientId,
      'groupChat': groupChat,
      'chatTimeStamp': chatTimeStamp,
      'chatId': chatId,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      messageContent: map['messageContent'],
      senderId: map['senderId'],
      recipientId: map['recipientId'],
      groupChat: map['groupChat'],
      chatTimeStamp: map['chatTimeStamp'],
      chatId: map['chatId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) => ChatMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatMessage(messageContent: $messageContent, senderId: $senderId, recipientId: $recipientId, groupChat: $groupChat, chatTimeStamp: $chatTimeStamp, chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ChatMessage &&
      other.messageContent == messageContent &&
      other.senderId == senderId &&
      other.recipientId == recipientId &&
      other.groupChat == groupChat &&
      other.chatTimeStamp == chatTimeStamp &&
      other.chatId == chatId;
  }

  @override
  int get hashCode {
    return messageContent.hashCode ^
      senderId.hashCode ^
      recipientId.hashCode ^
      groupChat.hashCode ^
      chatTimeStamp.hashCode ^
      chatId.hashCode;
  }
}
