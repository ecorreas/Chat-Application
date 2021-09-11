import 'dart:convert';

class MessageModel {
  final String message;
  final DateTime? sendedAt;
  final String indentification;

  MessageModel(
      {required this.message, this.sendedAt, required this.indentification});

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'sendedAt': DateTime.now().microsecondsSinceEpoch,
      'indentification': indentification,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      message: map['message'],
      sendedAt: DateTime.fromMillisecondsSinceEpoch(map['sendedAt']),
      indentification: map['indentification'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));
}
