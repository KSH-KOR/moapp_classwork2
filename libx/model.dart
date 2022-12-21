import 'package:flutter/material.dart';
//import 'package:uuid/uuid.dart';

class Model {
  final String name;
  final String studentNumber;
  final Image image;

  Model(
      {required this.name,
      required this.studentNumber,
      required this.image});
}

class Message {
  final Icon icon;
  final String title;
  final String contents;
  final String id;

  Message(
      {required this.icon,
      required this.title,
      required this.contents,
      required this.id});
}

class MessageBox {
  List<Message?> _messagebox = [
    Message(
        icon: const Icon(Icons.message, size: 40,), /*Icon : Icons.message, size: 40.0*/
        title: 'Recent Message',
        contents: 'Long time no see!',
      id: '0'/*const Uuid().v4()*/,
    ),
  ];

  void addMessage(Message newMessage) {
    _messagebox.add(newMessage);
  }

  void deleteMessage(Message newMessage) {}

  List<Message?> get messageList => _messagebox;
}