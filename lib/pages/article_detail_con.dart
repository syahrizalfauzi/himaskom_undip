import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/article_detail_pres.dart';
import 'package:himaskom_undip/pages/pengingat_settings_con.dart';
import 'package:himaskom_undip/providers/article_states.dart';
import 'package:himaskom_undip/utils/convert_utc_datetime.dart';
import 'package:himaskom_undip/utils/get_article_state.dart';
import 'package:himaskom_undip/widgets/custom_snackbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailPageContainer extends StatefulHookConsumerWidget {
  final Article article;

  const ArticleDetailPageContainer({Key? key, required this.article})
      : super(key: key);

  @override
  ConsumerState<ArticleDetailPageContainer> createState() =>
      _ArticleDetailPageContainerState();
}

class _ArticleDetailPageContainerState
    extends ConsumerState<ArticleDetailPageContainer> {
  final _imageController = LoopPageController();

  @override
  Widget build(BuildContext context) {
    final _articleState = ref.watch(getArticleStateFromArticle(widget.article));
    final _penyimpananArticleState = ref.read(penyimpananArticleState);
    final _currentImageIndex = useState(0.0);
    final _article = useState<Article?>(null);

    _handleTapIndicator(int index) {
      _imageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutExpo,
      );
    }

    _handleBagikan() async {
      final article = _article.value!;

      await Clipboard.setData(ClipboardData(text: article.shareString));
      ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackbar('Berhasil menyalin article / item ke clipboard'));
    }

    _handleHubungi() =>
        launch("https://liff.line.me/1645278921-kWRPP32q/?accountId=cvg5136w");
    _handlePengingat() async {
      final minutes = await showDialog<int>(
        context: context,
        builder: (_) => const PengingatSettingsContainer(),
      );
      if (minutes == null) return;

      final article = _article.value!;

      final scheduleTime =
          // article.tenggat!.subtract(Duration(minutes: minutes));

          convertUtcDatetime(article.tenggat!)
              .subtract(Duration(minutes: minutes));
      debugPrint("schedule at");
      debugPrint(scheduleTime.toString());

      String? body;
      switch (minutes) {
        case 1440:
          body = "H-24 Jam";
          break;
        case 300:
          body = "H-5 Jam";
          break;
        case 180:
          body = "H-3 Jam";
          break;
        case 60:
          body = "H-1 Jam";
          break;
        case 30:
          body = "H-30 Menit";
          break;
      }

      final result = await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: article.id.hashCode,
          channelKey: 'reminder',
          title: 'Pengingat : ${article.judul}',
          body: body,
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture: article.gambarUrl![0],
          payload: {
            'id': article.id!,
            'judul': article.judul,
            'jenisId': "-1",
          },
          autoDismissible: false,
        ),
        schedule: NotificationCalendar.fromDate(
            date: scheduleTime,
            // DateTime.now().add(const Duration(seconds: 10)),
            preciseAlarm: true),
        // schedule: NotificationCalendar.fromDate(date: scheduleTime),
      );

      debugPrint(result.toString());

      ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar(
          'Berhasil mengatur pengingat "${article.judul}" pada $body'));
    }

    _handleSimpan() async {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      String snackbarMessage;
      final article = _article.value!;

      if (!article.isSaved) {
        await _penyimpananArticleState.save(article: article, token: token);
        snackbarMessage = 'Berhasil menyimpan article "${article.judul}"';
      } else {
        await _penyimpananArticleState.unsave(article: article, token: token);
        snackbarMessage =
            'Berhasil menghapus simpanan article "${article.judul}"';
      }

      final isSaved = _penyimpananArticleState.checkSavedSingle(article);
      _article.value = article.copyWith(isSaved: isSaved);

      ref
          .read(getArticleStateFromArticle(article))
          .setIsSaved(article, !article.isSaved);
      ref.read(berandaArticleState).setIsSaved(article, !article.isSaved);

      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackbar(snackbarMessage));
    }

    _fetch() async {
      _article.value = null;
      final article = await _articleState.get(widget.article.id!);

      if (article == null) {
        Navigator.of(context).pop(false);
        return;
      }

      _articleState.checkSaved(_penyimpananArticleState.articles);
      final isSaved = _penyimpananArticleState.checkSavedSingle(article);

      _article.value = article.copyWith(isSaved: isSaved);
    }

    useEffect(() {
      _imageController.addListener(() {
        _currentImageIndex.value = _imageController.page;
      });

      _fetch();
      return null;
    }, []);

    return ArticleDetailPagePresentational(
      imageController: _imageController,
      currentImageIndex: _currentImageIndex.value,
      onTapIndicator: _handleTapIndicator,
      article: _article.value,
      onBagikan: _handleBagikan,
      onHubungi: _handleHubungi,
      onPengingat: _handlePengingat,
      onSimpan: _handleSimpan,
      onRefresh: _fetch,
    );
  }
}
