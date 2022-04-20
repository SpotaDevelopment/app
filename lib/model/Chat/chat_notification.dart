import 'dart:convert';

class ChatNotification {
  String? id;
  String? senderId;
  String? date;
  ChatNotification({this.id, this.senderId, this.date});

  ChatNotification copyWith({
    String? id,
    String? senderId,
    String? date,
  }) {
    return ChatNotification(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'date': date,
    };
  }

  factory ChatNotification.fromMap(Map<String, dynamic> map) {
    return ChatNotification(
      id: map['id'],
      senderId: map['senderId'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatNotification.fromJson(String source) =>
      ChatNotification.fromMap(json.decode(source));

  @override
  String toString() =>
      'ChatNotification(id: $id, senderId: $senderId, date: $date)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatNotification &&
        other.id == id &&
        other.senderId == senderId &&
        other.date == date;
  }

  @override
  int get hashCode => id.hashCode ^ senderId.hashCode ^ date.hashCode;
}
