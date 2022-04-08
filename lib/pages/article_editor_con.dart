import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state_item.dart';
import 'package:himaskom_undip/pages/article_editor_pres.dart';
import 'package:himaskom_undip/utils/article_editor_helper.dart';
import 'package:himaskom_undip/utils/get_article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ArticleEditorPageContainer extends StatefulHookConsumerWidget {
  final ArticleStateItem stateItem;
  final Article? initialArticle;

  const ArticleEditorPageContainer({
    Key? key,
    required this.stateItem,
    this.initialArticle,
  }) : super(key: key);

  @override
  ConsumerState<ArticleEditorPageContainer> createState() =>
      _ArticleEditorPageContainerState();
}

class _ArticleEditorPageContainerState
    extends ConsumerState<ArticleEditorPageContainer> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _isLoading = useState(widget.initialArticle == null ? false : true);
    final _tenggatDateController = useTextEditingController();
    final _tenggatTimeController = useTextEditingController();
    final _judulController = useTextEditingController();
    final _deskripsiController = useTextEditingController();
    final _hargaController = useTextEditingController();
    final _removedImageUrls = useState<List<String>>([]);
    final _images = useState<List<ImageProvider>>([]);
    final _tenggatDate = useState<DateTime?>(null);
    final _tenggatTime = useState<TimeOfDay?>(null);
    final _tagIndex = useState(0);

    void _handleImageChange(List<ImageProvider> images) =>
        _images.value = images;
    void _handleImageRemove(String url) => _removedImageUrls.value.add(url);
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

    void _handleTagChange(int index) => _tagIndex.value = index;

    String? _hargaValidator(String harga) {
      final hargaNumber = int.tryParse(harga);

      if (hargaNumber == null) return "Harga harus berupa angka";
      if (hargaNumber < 1) return "Harga harus lebih dari 0";

      return null;
    }

    String? _tenggatDateValidator(String tenggatDate) {
      if (_tenggatDate.value == null || tenggatDate.isEmpty) {
        return 'Harus diisi';
      }
      return null;
    }

    String? _tenggatTimeValidator(String tenggatTime) {
      if (_tenggatTime.value == null || tenggatTime.isEmpty) {
        return 'Harus diisi';
      }
      return null;
    }

    Future<void> _handleFetch() async {
      _isLoading.value = true;

      final state =
          ref.read(getArticleStateFromArticle(widget.initialArticle!));
      final article = await state.get(widget.initialArticle!.id);
      final tagPair = getTagFromArticle(article);

      _images.value =
          (article.gambarUrl ?? []).map((e) => NetworkImage(e)).toList();
      _judulController.text = article.judul;
      _deskripsiController.text = article.deskripsi!;
      _hargaController.text = article.harga.toString();

      if (article.tenggat != null) {
        _tenggatDate.value = article.tenggat;
        _tenggatDateController.text =
            DateFormat('dd/MM/yyyy').format(article.tenggat!);

        final time = TimeOfDay.fromDateTime(article.tenggat!);
        _tenggatTime.value = time;
        _tenggatTimeController.text = time.format(context);
      }
      _tagIndex.value = tagPair.key;

      _isLoading.value = false;
    }

    Future<void> _handleSubmit() async {
      _isLoading.value = true;
      if (!_formKey.currentState!.validate()) {
        _isLoading.value = false;
        return;
      }
      await Future.delayed(const Duration(seconds: 1));

      for (var image in _images.value) {
        if (image is FileImage) {
          debugPrint(image.file.path);
        } else if (image is NetworkImage) {
          debugPrint(image.url);
        }
      }
      debugPrint(_removedImageUrls.value.toString());

      final gambarUrl = [
        'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
      ];

      String jenis;
      if (widget.stateItem.category == ArticleStateItemCategory.event ||
          widget.stateItem.category == ArticleStateItemCategory.karir ||
          widget.stateItem.category == ArticleStateItemCategory.lomba) {
        jenis = getTags(widget.stateItem.category)![_tagIndex.value].name;
      } else {
        jenis = widget.stateItem.category.name;
      }

      DateTime? tenggat;
      if (widget.stateItem.category == ArticleStateItemCategory.event) {
        tenggat = _tenggatDate.value!.add(
          Duration(
            hours: _tenggatTime.value!.hour,
            minutes: _tenggatTime.value!.minute,
          ),
        );
      }

      final data = {
        'judul': _judulController.text,
        'gambarUrl': gambarUrl,
        'createdAt': DateTime.now().toString(),
        'harga': int.tryParse(_hargaController.text) ?? 0,
        'deskripsi': _deskripsiController.text,
        'jenis': jenis,
        'tenggat': tenggat,
      };

      debugPrint(data.toString());
      _isLoading.value = false;
    }

    useEffect(() {
      if (widget.initialArticle != null) _handleFetch();
      return;
    }, []);

    return Form(
      key: _formKey,
      child: ArticleEditorPagePresentational(
        isLoading: _isLoading.value,
        initialImageUrls: widget.initialArticle?.gambarUrl ?? [],
        onImageChange: _handleImageChange,
        onImageRemove: _handleImageRemove,
        judulController: _judulController,
        deskripsiController: _deskripsiController,
        hargaController: getHargaController(widget.stateItem, _hargaController),
        onTenggatDateTap: getTenggatTap(
          widget.stateItem,
          _handleTenggatDateTap,
        ),
        tenggatDateController: getTenggatController(
          widget.stateItem,
          _tenggatDateController,
        ),
        onTenggatTimeTap: getTenggatTap(
          widget.stateItem,
          _handleTenggatTimeTap,
        ),
        tenggatTimeController: getTenggatController(
          widget.stateItem,
          _tenggatTimeController,
        ),
        onTagChange: getTagChange(
          widget.stateItem,
          _handleTagChange,
        ),
        selectedTagIndex: getTagIndex(
          widget.stateItem,
          _tagIndex.value,
        ),
        tags: getTags(
          widget.stateItem.category,
        ),
        onSubmit: _handleSubmit,
        hargaValidator: _hargaValidator,
        tenggatDateValidator: _tenggatDateValidator,
        tenggatTimeValidator: _tenggatTimeValidator,
      ),
    );
  }
}
