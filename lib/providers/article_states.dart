import 'package:himaskom_undip/states/akademik_article.dart';
import 'package:himaskom_undip/states/beasiswa_article.dart';
import 'package:himaskom_undip/states/beranda_article.dart';
import 'package:himaskom_undip/states/event_am_article.dart';
import 'package:himaskom_undip/states/event_hm_article.dart';
import 'package:himaskom_undip/states/event_ukm_article.dart';
import 'package:himaskom_undip/states/karir_loker_article.dart';
import 'package:himaskom_undip/states/karir_magang_article.dart';
import 'package:himaskom_undip/states/lomba_akademik_article.dart';
import 'package:himaskom_undip/states/lomba_nonakademik_article.dart';
import 'package:himaskom_undip/states/notifikasi_article.dart';
import 'package:himaskom_undip/states/penyimpanan_article.dart';
import 'package:himaskom_undip/states/prestasi_article.dart';
import 'package:himaskom_undip/states/search_article.dart';
import 'package:himaskom_undip/states/sistore_article.dart';
import 'package:himaskom_undip/states/umum_article.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final akademikArticleState =
    ChangeNotifierProvider((_) => AkademikArticleState());
final beasiswaArticleState =
    ChangeNotifierProvider((_) => BeasiswaArticleState());
final berandaArticleState =
    ChangeNotifierProvider((_) => BerandaArticleState());
final eventAmArticleState =
    ChangeNotifierProvider((_) => EventAmArticleState());
final eventHmArticleState =
    ChangeNotifierProvider((_) => EventHmArticleState());
final eventUkmArticleState =
    ChangeNotifierProvider((_) => EventUkmArticleState());
final karirLokerArticleState =
    ChangeNotifierProvider((_) => KarirLokerArticleState());
final karirMagangArticleState =
    ChangeNotifierProvider((_) => KarirMagangArticleState());
final lombaAkademikArticleState =
    ChangeNotifierProvider((_) => LombaAkademikArticleState());
final lombaNonakademikArticleState =
    ChangeNotifierProvider((_) => LombaNonakademikArticleState());
final notifikasiArticleState =
    ChangeNotifierProvider((_) => NotifikasiArticleState());
final penyimpananArticleState =
    ChangeNotifierProvider((_) => PenyimpananArticleState());
final prestasiArticleState =
    ChangeNotifierProvider((_) => PrestasiArticleState());
final searchArticleState = ChangeNotifierProvider((_) => SearchArticleState());
final sistoreArticleState =
    ChangeNotifierProvider((_) => SistoreArticleState());
final umumArticleState = ChangeNotifierProvider((_) => UmumArticleState());
