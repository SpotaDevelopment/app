import 'dart:convert';

class ChatMessage {
  String? message;
  String? senderId;
  String? recipientId;
  String? chatId;
  ChatMessage({
    required this.message,
    this.senderId,
    this.recipientId,
    this.chatId,
  });

  ChatMessage copyWith({
    String? message,
    String? senderId,
    String? recipientId,
    String? chatId,
  }) {
    return ChatMessage(
      message: message ?? this.message,
      senderId: senderId ?? this.senderId,
      recipientId: recipientId ?? this.recipientId,
      chatId: chatId ?? this.chatId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'senderId': senderId,
      'recipientId': recipientId,
      'chatId': chatId,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      message: map['message'],
      senderId: map['senderId'],
      recipientId: map['recipientId'],
      chatId: map['chatId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) =>
      ChatMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatMessage(message: $message, senderId: $senderId, recipientId: $recipientId, chatId: $chatId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatMessage &&
        other.message == message &&
        other.senderId == senderId &&
        other.recipientId == recipientId &&
        other.chatId == chatId;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        senderId.hashCode ^
        recipientId.hashCode ^
        chatId.hashCode;
  }
}
