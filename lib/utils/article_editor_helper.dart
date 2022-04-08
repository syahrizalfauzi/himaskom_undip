import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state_item.dart';
import 'package:himaskom_undip/models/tag.dart';

void Function()? getTenggatTap(
        ArticleStateItem stateItem, void Function() callback) =>
    stateItem.category == ArticleStateItemCategory.event ? callback : null;

TextEditingController? getTenggatController(
        ArticleStateItem stateItem, TextEditingController controller) =>
    stateItem.category == ArticleStateItemCategory.event ? controller : null;
TextEditingController? getHargaController(
        ArticleStateItem stateItem, TextEditingController controller) =>
    stateItem.category == ArticleStateItemCategory.sistore ? controller : null;

bool _isUsingTags(ArticleStateItem stateItem) =>
    stateItem.category == ArticleStateItemCategory.event ||
    stateItem.category == ArticleStateItemCategory.karir ||
    stateItem.category == ArticleStateItemCategory.lomba;

void Function(int)? getTagChange(
        ArticleStateItem stateItem, void Function(int) callback) =>
    _isUsingTags(stateItem) ? callback : null;

int? getTagIndex(ArticleStateItem stateItem, int index) =>
    _isUsingTags(stateItem) ? index : null;

List<Tag>? getTags(ArticleStateItemCategory category) {
  switch (category) {
    case ArticleStateItemCategory.event:
      return const [
        Tag(title: 'HIMASKOM', name: 'event_hm'),
        Tag(title: 'Al-Muharrik', name: 'event_am'),
        Tag(title: 'UKM Tekkom', name: 'event_ukm'),
      ];
    case ArticleStateItemCategory.karir:
      return const [
        Tag(title: 'Lowongan Kerja', name: 'karir_loker'),
        Tag(title: 'Magang', name: 'karir_magang'),
      ];
    case ArticleStateItemCategory.lomba:
      return const [
        Tag(title: 'Akademik', name: 'lomba_akademik'),
        Tag(title: 'Non-Akademik', name: 'lomba_nonakademik'),
      ];
    default:
      return null;
  }
}

MapEntry<int, Tag?> getTagFromArticle(Article article) {
  switch (article.jenis) {
    case ArticleCategory.eventHm:
      return MapEntry(0, getTags(ArticleStateItemCategory.event)?[0]);
    case ArticleCategory.eventAm:
      return MapEntry(1, getTags(ArticleStateItemCategory.event)?[0]);
    case ArticleCategory.eventUkm:
      return MapEntry(2, getTags(ArticleStateItemCategory.event)?[0]);
    case ArticleCategory.karirLoker:
      return MapEntry(0, getTags(ArticleStateItemCategory.karir)?[0]);
    case ArticleCategory.karirMagang:
      return MapEntry(1, getTags(ArticleStateItemCategory.karir)?[0]);
    case ArticleCategory.lombaAkademik:
      return MapEntry(0, getTags(ArticleStateItemCategory.lomba)?[0]);
    case ArticleCategory.lombaNonakademik:
      return MapEntry(1, getTags(ArticleStateItemCategory.lomba)?[0]);
    default:
      return const MapEntry(0, null);
  }
}
