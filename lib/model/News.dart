import 'dart:convert';



class News {
  String title;
  String URL;
  String source;
  News({
    required this.title,
    required this.URL,
    required this.source,
  });

  News copyWith({
    String? title,
    String? URL,
    String? source,
  }) {
    return News(
      title: title ?? this.title,
      URL: URL ?? this.URL,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'URL': URL,
      'source': source,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      title: map['title'] ?? '',
      URL: map['URL'] ?? '',
      source: map['source'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source));

  @override
  String toString() => 'News(title: $title, URL: $URL, source: $source)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is News &&
      other.title == title &&
      other.URL == URL &&
      other.source == source;
  }

  @override
  int get hashCode => title.hashCode ^ URL.hashCode ^ source.hashCode;
}
