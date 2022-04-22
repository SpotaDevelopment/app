import 'dart:convert';

class Message {
  String? messageContent;
  String? senderId;
  String? recipientId;
  String? groupChat;
  String? chatTimeStamp;
  //String? chatId;
  Message({
    this.messageContent,
    this.senderId,
    this.recipientId,
    this.groupChat,
    this.chatTimeStamp,
    // this.chatId,
  });

  Message copyWith({
    String? messageContent,
    String? senderId,
    String? recipientId,
    String? groupChat,
    String? chatTimeStamp,
    // String? chatId,
  }) {
    return Message(
      messageContent: messageContent ?? this.messageContent,
      senderId: senderId ?? this.senderId,
      recipientId: recipientId ?? this.recipientId,
      groupChat: groupChat ?? this.groupChat,
      chatTimeStamp: chatTimeStamp ?? this.chatTimeStamp,
      // chatId: chatId ?? this.chatId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'messageContent': messageContent,
      'senderId': senderId,
      'recipientId': recipientId,
      'groupChat': groupChat,
      'chatTimeStamp': chatTimeStamp,
      // 'chatId': chatId,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      messageContent: map['messageContent'],
      senderId: map['senderId'],
      recipientId: map['recipientId'],
      groupChat: map['groupChat'],
      chatTimeStamp: map['chatTimeStamp'],
      //  chatId: map['chatId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatMessage(messageContent: $messageContent, senderId: $senderId, recipientId: $recipientId, groupChat: $groupChat, chatTimeStamp: $chatTimeStamp)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Message &&
        other.messageContent == messageContent &&
        other.senderId == senderId &&
        other.recipientId == recipientId &&
        other.groupChat == groupChat &&
        other.chatTimeStamp == chatTimeStamp;
    //other.chatId == chatId;
  }

  @override
  int get hashCode {
    return messageContent.hashCode ^
        senderId.hashCode ^
        recipientId.hashCode ^
        groupChat.hashCode ^
        chatTimeStamp.hashCode;
    // chatId.hashCode;
  }
}
