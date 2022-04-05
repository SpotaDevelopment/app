class NewsPost {
  String? url;
  String? title;
  String? source;
  String? image;

  NewsPost({this.url, this.title, this.source});

  NewsPost.fromJson(Map<String, dynamic> json) {
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
}
