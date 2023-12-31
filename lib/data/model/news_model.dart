class NewsModel {
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;
  final SourceModel source;
  NewsModel({
    this.author,
    this.content,
    this.description,
    required this.publishedAt,
    required this.title,
    required this.url,
    this.urlToImage,
    required this.source,
  });
  factory NewsModel.fromJson(Map json) => NewsModel(
        author: json['author'],
        publishedAt: json['publishedAt'],
        source: SourceModel.fromJson(json['source']),
        title: json['title'],
        url: json['url'],
        content: json['content'],
        description: json['description'],
        urlToImage: json['urlToImage'],
      );
  Map<String, dynamic> toJson() => {
        'author': author,
        'publishedAt': publishedAt,
        'source': source.toJson(),
        'title': title,
        'url': url,
        'content': content,
        'description': description,
        'urlToImage': urlToImage,
      };
}

class SourceModel {
  final String? id;
  final String name;
  SourceModel({
    required this.name,
    this.id,
  });
  factory SourceModel.fromJson(Map json) => SourceModel(
        name: json['name'],
        id: json['id'],
      );
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
      };
}
