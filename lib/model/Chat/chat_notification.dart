import 'dart:convert';

class ChatNotification {
  String? id;
  String? senderId;
  String? senderName;
  ChatNotification({
    this.id,
    this.senderId,
    this.senderName,
  });

  ChatNotification copyWith({
    String? id,
    String? senderId,
    String? senderName,
  }) {
    return ChatNotification(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'senderName': senderName,
    };
  }

  factory ChatNotification.fromMap(Map<String, dynamic> map) {
    return ChatNotification(
      id: map['id'],
      senderId: map['senderId'],
      senderName: map['senderName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatNotification.fromJson(String source) =>
      ChatNotification.fromMap(json.decode(source));

  @override
  String toString() =>
      'ChatNotification(id: $id, senderId: $senderId, senderName: $senderName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatNotification &&
        other.id == id &&
        other.senderId == senderId &&
        other.senderName == senderName;
  }

  @override
  int get hashCode => id.hashCode ^ senderId.hashCode ^ senderName.hashCode;
}
