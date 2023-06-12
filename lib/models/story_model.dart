import 'package:flutter/material.dart';

// model cerita asli

class StoryList extends ChangeNotifier {
  String id,
      title,
      description,
      writer,
      categories,
      imageUrl,
      part,
      content,
      uid;
  DateTime createdAt;

  StoryList(
      {required this.id,
      required this.uid,
      required this.title,
      required this.description,
      required this.writer,
      required this.categories,
      required this.imageUrl,
      required this.part,
      required this.content,
      required this.createdAt});
}
