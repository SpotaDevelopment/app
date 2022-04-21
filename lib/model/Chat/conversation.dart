import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:sign_ups/model/Chat/chat_message.dart';

class Conversation {
  String? groupChatName;
  List<ChatMessage>? messageList;
  Conversation({
    this.groupChatName,
    this.messageList,
  });

  Conversation copyWith({
    String? groupChatName,
    List<ChatMessage>? messageList,
  }) {
    return Conversation(
      groupChatName: groupChatName ?? this.groupChatName,
      messageList: messageList ?? this.messageList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'groupChatName': groupChatName,
      'messageList': messageList?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Conversation.fromMap(Map<String, dynamic> map) {
    return Conversation(
      groupChatName: map['groupChatName'],
      messageList: map['messageList'] != null
          ? List<ChatMessage>.from(
              map['messageList']?.map((x) => ChatMessage.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Conversation.fromJson(String source) =>
      Conversation.fromMap(json.decode(source));

  @override
  String toString() =>
      'Conversation(groupChatName: $groupChatName, messageList: $messageList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Conversation &&
        other.groupChatName == groupChatName &&
        listEquals(other.messageList, messageList);
  }

  @override
  int get hashCode => groupChatName.hashCode ^ messageList.hashCode;
}
