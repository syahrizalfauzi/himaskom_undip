import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:http/http.dart' as http;

abstract class ArticleState extends ChangeNotifier {
  final String _baseUrl = "https://himaskom-undip-backend.et.r.appspot.com/";
  final String fetchUrl = "";
  final String title = "Articles";
  List<Article> articles = sampleArticles;
  bool isLoading = false;

  Future<void> getAll() async {
    isLoading = true;
    notifyListeners();
    articles = articles.reversed.toList();
    await Future.delayed(const Duration(seconds: 1));
    // final response = await http.get(Uri.parse(_baseUrl + fetchUrl));
    // final data = jsonDecode(response.body)["data"] as List?;

    // if (data == null) {
    //   articles = [];
    // } else {
    //   articles = data.map((e) => Article.fromJson(e)).toList();
    // }
    isLoading = false;
    notifyListeners();
  }

  Future<Article> get(String id) async {
    // final response = await http.get(Uri.parse(_baseUrl + '/$id'));
    final index = articles.indexWhere((e) => e.id == id);
    await Future.delayed(const Duration(seconds: 1));
    // final article = Article.fromJson(jsonDecode(response.body)["data"]);
    final article = Article(
      id: id,
      judul: "Judul Article 1",
      gambarUrl: [
        'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
      ],
      deskripsi: "Halo ni deskripsi",
      createdAt: DateTime.now(),
      jenis: ArticleCategory.eventAm,
      harga: 120,
      tenggat: null,
    );

    if (index == -1) {
      articles.insert(0, article);
    }
    // UNCOMMENT FOR API FETCH
    // else {
    //   articles[index] = article;
    // }

    return articles[index];
  }
}

final sampleArticles = [
  Article(
    id: "id-1",
    judul: "Judul Article 1",
    gambarUrl: [
      'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
    ],
    createdAt: DateTime.now(),
    jenis: ArticleCategory.akademik,
    harga: 0,
    tenggat: null,
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
    tenggat: null,
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
    tenggat: null,
  ),
];
