import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:http/http.dart' as http;

abstract class ArticleState extends ChangeNotifier {
  final String _baseUrl = "https://himaskom-undip-backend.et.r.appspot.com/";
  final String fetchUrl = "";
  final String title = "Articles";
  List<Article> articles = _sampleArticles;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetch() async {
    _isLoading = true;
    notifyListeners();
    final response = await http.get(Uri.parse(_baseUrl + fetchUrl));
    final data = jsonDecode(response.body)["data"] as List?;

    if (data == null) {
      articles = [];
    } else {
      articles = data.map((e) => Article.fromJson(e)).toList();
    }
    _isLoading = false;
    notifyListeners();
  }
}

final _sampleArticles = [
  Article(
    id: "id-1",
    judul: "Judul Article 1",
    gambarUrl: [
      'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
    ],
    createdAt: DateTime.now(),
    jenis: ArticleCategory.akademik,
    harga: 0,
  ),
  Article(
    id: "id-2",
    judul: "Judul Article 2",
    gambarUrl: [
      'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
    ],
    createdAt: DateTime.now(),
    jenis: ArticleCategory.beasiswa,
    harga: 0,
  ),
  Article(
    id: "id-3",
    judul: "Judul Article 3",
    gambarUrl: [
      'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
    ],
    createdAt: DateTime.now(),
    jenis: ArticleCategory.eventAm,
    harga: 0,
  ),
];
