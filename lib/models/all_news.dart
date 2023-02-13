class AllNews {
  final String author;
  final String content;
  final String date;
  final String imageUrl;
  final String time;
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
