import 'package:hive/hive.dart';

part 'all_news.g.dart';

@HiveType(typeId: 0)
class AllNews {
  @HiveField(0)
  final String author;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final String time;
  @HiveField(5)
  final String title;

  AllNews(
      {required this.author,
      required this.content,
      required this.date,
      required this.imageUrl,
      required this.time,
      required this.title});

  factory AllNews.fromJson(Map<String, dynamic> json) {
    return AllNews(
        author: json['author'],
        content: json['content'],
        date: json['date'],
        imageUrl: json['imageUrl'],
        time: json['time'],
        title: json['title']);
  }
}
