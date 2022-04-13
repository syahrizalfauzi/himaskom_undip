import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/article_detail_pres.dart';
import 'package:himaskom_undip/pages/pengingat_settings_con.dart';
import 'package:himaskom_undip/states/penyimpanan_article.dart';
import 'package:himaskom_undip/utils/get_article_state.dart';
import 'package:himaskom_undip/widgets/custom_snackbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loop_page_view/loop_page_view.dart';

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

    _handleBagikan() {}
    _handleHubungi() {}
    _handlePengingat() {
      showDialog(
        context: context,
        builder: (_) => const PengingatSettingsContainer(),
      );
    }

    _handleSimpan() async {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      await _penyimpananArticleState.save(
        article: _article.value!,
        token: token,
      );

      final article = _article.value!;
      final isSaved = _penyimpananArticleState.checkSavedSingle(article);

      _article.value = article.copyWith(isSaved: isSaved);
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar(
          'Berhasil menyimpan article "${_article.value!.judul}"'));
    }

    _fetch() async {
      _article.value = null;
      final article = await _articleState.get(widget.article.id!);
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
