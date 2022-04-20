import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';

import 'News.dart';

class NewsResults {
  String? teamName;
  List<News>? newsList;

  NewsResults({this.teamName, this.newsList});

  NewsResults.fromJson(Map<String, dynamic> json) {
    teamName = json['teamName'];
    if (json['newsList'] != null) {
      newsList = <News>[];
      json['newsList'].forEach((v) {
        newsList!.add(new News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teamName'] = this.teamName;
    if (this.newsList != null) {
      data['newsList'] = this.newsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
