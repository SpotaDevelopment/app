import 'dart:convert';

class News {
  String? url;
  String? title;
  String? source;
  String? image;

  News({
    this.url,
    this.title,
    this.source,
    this.image,
  });

  News.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
    source = json['source'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['title'] = this.title;
    data['source'] = this.source;
    data['image'] = this.image;
    return data;
  }

  News copyWith({
    String? url,
    String? title,
    String? source,
    String? image,
  }) {
    return News(
      url: url ?? this.url,
      title: title ?? this.title,
      source: source ?? this.source,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'title': title,
      'source': source,
      'image': image,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      url: map['url'],
      title: map['title'],
      source: map['source'],
      image: map['image'],
    );
  }

  @override
  String toString() {
    return 'NewsPost(url: $url, title: $title, source: $source, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is News &&
        other.url == url &&
        other.title == title &&
        other.source == source &&
        other.image == image;
  }

  @override
  int get hashCode {
    return url.hashCode ^ title.hashCode ^ source.hashCode ^ image.hashCode;
  }
}
