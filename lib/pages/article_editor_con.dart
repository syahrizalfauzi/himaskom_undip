import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state_item.dart';
import 'package:himaskom_undip/pages/article_editor_pres.dart';
import 'package:himaskom_undip/utils/article_editor_helper.dart';
import 'package:himaskom_undip/utils/get_article_state.dart';
import 'package:himaskom_undip/utils/get_random_string.dart';
import 'package:himaskom_undip/utils/parse_article_category.dart';
import 'package:himaskom_undip/widgets/custom_snackbar.dart';
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
    final _isImageError = useState(false);
    final _removedImageUrls = useState<List<String>>([]);
    final _images = useState<List<ImageProvider>>([]);
    final _tenggatDate = useState<DateTime?>(null);
    final _tenggatTime = useState<TimeOfDay?>(null);
    final _tagIndex = useState(0);

    _handleImageChange(List<ImageProvider> images) {
      _isImageError.value = false;
      _images.value = images;
    }

    _handleImageRemove(String url) => _removedImageUrls.value.add(url);
    _handleTenggatDateTap() async {
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

    _handleTenggatTimeTap() async {
      final time = await showTimePicker(
        context: context,
        initialTime: _tenggatTime.value ?? TimeOfDay.now(),
      );
      if (time == null) return;
      _tenggatTime.value = time;
      _tenggatTimeController.text = time.format(context);
    }

    _handleTagChange(int index) => _tagIndex.value = index;

    _fetch() async {
      _isLoading.value = true;

      final state =
          ref.read(getArticleStateFromArticle(widget.initialArticle!));
      final article = await state.get(widget.initialArticle!.id!);
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

    _handleSubmit() async {
      final user = FirebaseAuth.instance.currentUser;

      _isImageError.value = false;
      if (!_formKey.currentState!.validate()) {
        return;
      }
      if (_images.value.isEmpty) {
        _isImageError.value = true;
        return;
      }

      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackbar("Sesi user tidak valid, silahkan log in kembali"));
      }

      _isLoading.value = true;

      final gambarUrlDeletion = _removedImageUrls.value;
      if (gambarUrlDeletion.isNotEmpty) {
        try {
          await Future.wait(gambarUrlDeletion.map(
            (e) => FirebaseStorage.instance.refFromURL(e).delete(),
          ));
        } catch (e) {
          debugPrint(e.toString());
        }
      }

      final gambarUrl = await Future.wait(
        _images.value.map((e) {
          if (e is FileImage) {
            return FirebaseStorage.instance
                .ref()
                .child(DateTime.now().toIso8601String() +
                    '_' +
                    getRandomString(20))
                .putFile((e).file)
                .then((s) => s.ref.getDownloadURL());
          }

          return Future.value((e as NetworkImage).url);
        }),
      );

      ArticleCategory jenis;
      if (widget.stateItem.category == ArticleStateItemCategory.event ||
          widget.stateItem.category == ArticleStateItemCategory.karir ||
          widget.stateItem.category == ArticleStateItemCategory.lomba) {
        jenis = parseArticleCategory(
            getTags(widget.stateItem.category)![_tagIndex.value].name);
      } else {
        jenis = parseArticleCategory(widget.stateItem.category.name);
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

      final article = Article(
        id: widget.initialArticle?.id,
        judul: _judulController.text,
        gambarUrl: gambarUrl,
        tenggat: tenggat,
        jenis: jenis,
        harga: int.tryParse(_hargaController.text) ?? 0,
        deskripsi: _deskripsiController.text,
      );

      final state = ref.read(getArticleStateFromArticle(article));
      final token = await user!.getIdToken();

      String? result;
      if (widget.initialArticle == null) {
        result = await state.add(article: article, token: token);
      } else {
        result = await state.update(article: article, token: token);
      }

      ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar(result ??
          "Berhasil menyimpan ${widget.initialArticle == null ? _judulController.text : widget.initialArticle!.id}"));

      _isLoading.value = false;
      if (result == null) {
        Navigator.of(context).pop();
      }
    }

    _hargaValidator(String harga) {
      final hargaNumber = int.tryParse(harga);

      if (hargaNumber == null) return "Harga harus berupa angka";
      if (hargaNumber < 1) return "Harga harus lebih dari 0";

      return null;
    }

    _tenggatValidator(String tenggatDate) {
      if (_tenggatDate.value == null || tenggatDate.isEmpty) {
        return 'Harus diisi';
      }
      return null;
    }

    useEffect(() {
      if (widget.initialArticle != null) _fetch();
      return;
    }, []);

    return Form(
      key: _formKey,
      child: ArticleEditorPagePresentational(
        isLoading: _isLoading.value,
        isImageError: _isImageError.value,
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
        tenggatDateValidator: _tenggatValidator,
        tenggatTimeValidator: _tenggatValidator,
      ),
    );
  }
}
