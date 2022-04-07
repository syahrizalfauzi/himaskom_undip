import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state_item.dart';
import 'package:himaskom_undip/models/tag.dart';
import 'package:himaskom_undip/pages/article_editor_pres.dart';
import 'package:himaskom_undip/utils/article_editor_helper.dart';
import 'package:himaskom_undip/utils/get_article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ArticleEditorPageContainer extends HookConsumerWidget {
  final ArticleStateItem stateItem;
  final Article? initialArticle;

  const ArticleEditorPageContainer({
    Key? key,
    required this.stateItem,
    this.initialArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _isLoading = useState(initialArticle == null ? false : true);
    final _tenggatDateController = useTextEditingController();
    final _tenggatTimeController = useTextEditingController();
    final _removedImageIndex = useState<List<int>>([]);
    final _images = useState<List<ImageProvider>>([]);
    final _judul = useState("");
    final _deskripsi = useState("");
    final _harga = useState("");
    final _tenggatDate = useState<DateTime?>(null);
    final _tenggatTime = useState<TimeOfDay?>(null);
    final _tag = useState<Tag?>(null);
    final _tagIndex = useState(0);

    void _handleImageChange(List<ImageProvider> images) =>
        _images.value = images;
    void _handleImageRemove(int index) => _removedImageIndex.value.add(index);
    void _handleJudulChange(String judul) => _judul.value = judul;
    void _handleDeskripsiChange(String deskripsi) =>
        _deskripsi.value = deskripsi;
    void _handleHargaChange(String harga) => _harga.value = harga;
    void _handleTenggatDateTap() async {
      final date = await showDatePicker(
        context: context,
        initialDate: _tenggatDate.value ?? DateTime.now(),
        locale: const Locale('id', 'ID'),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          const Duration(days: 365),
        ),
      );
      if (date == null) return;
      _tenggatDate.value = date;
      _tenggatDateController.text = DateFormat('dd/MM/yyyy').format(date);
    }

    void _handleTenggatTimeTap() async {
      final time = await showTimePicker(
        context: context,
        initialTime: _tenggatTime.value ?? TimeOfDay.now(),
      );
      if (time == null) return;
      _tenggatTime.value = time;
      _tenggatTimeController.text = time.format(context);
    }

    void _handleTagChange(Tag tag, int index) {
      _tagIndex.value = index;
      _tag.value = tag;
    }

    Future<void> _handleFetch() async {
      _isLoading.value = true;
      final state = ref.read(getArticleStateFromArticle(initialArticle!));
      final article = await state.get(initialArticle!.id);
      final tagPair = getTagFromArticle(article);

      _images.value =
          (article.gambarUrl ?? []).map((e) => NetworkImage(e)).toList();
      _judul.value = article.judul;
      _deskripsi.value = article.deskripsi!;
      _harga.value = article.harga!.toString();
      _tenggatDate.value = article.tenggat;
      _tag.value = tagPair.value;
      _tagIndex.value = tagPair.key;

      _isLoading.value = false;
    }

    Future<void> _handleSubmit() async {
      _isLoading.value = true;
      await Future.delayed(const Duration(seconds: 1));
      _isLoading.value = false;
    }

    useEffect(() {
      if (initialArticle != null) _handleFetch();
      return;
    }, []);

    return ArticleEditorPagePresentational(
      isLoading: _isLoading.value,
      initialImageUrls: initialArticle?.gambarUrl ?? [],
      onImageChange: _handleImageChange,
      onImageRemove: _handleImageRemove,
      onJudulChange: _handleJudulChange,
      onDeskripsiChange: _handleDeskripsiChange,
      onHargaChange: getHargaChange(stateItem, _handleHargaChange),
      onTenggatDateTap: getTenggatTap(stateItem, _handleTenggatDateTap),
      tenggatDateController:
          getTenggatController(stateItem, _tenggatDateController),
      onTenggatTimeTap: getTenggatTap(stateItem, _handleTenggatTimeTap),
      tenggatTimeController:
          getTenggatController(stateItem, _tenggatTimeController),
      onTagChange: getTagChange(stateItem, _handleTagChange),
      selectedTagIndex: getTagIndex(stateItem, _tagIndex.value),
      tags: getTags(stateItem.category),
      onSubmit: _handleSubmit,
    );
  }
}
