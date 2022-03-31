import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/widgets/articleshortitem.dart';

class ArticleShortList extends HookWidget {
  final String fetchUrl;
  final bool isAdminVariant;

  const ArticleShortList({
    Key? key,
    required this.fetchUrl,
    this.isAdminVariant = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(true);

    Future<void> _fetch() async {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 1));
      isLoading.value = false;
    }

    useEffect(() {
      _fetch();
      return null;
    }, []);

    return RefreshIndicator(
      onRefresh: _fetch,
      child: isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 24,
                    right: 24,
                    bottom: index == 9 ? 16 : 0,
                  ),
                  child: ArticleShortItem(
                    id: index.toString(),
                    judul:
                        '[Jenis] Article Nomor $index Tapi Super Duper Panjang Kayak Gimana Gitu Ya SAD ASD ASD ASD ADS ASD ASD ASD ',
                    isAdminVariant: isAdminVariant,
                    thumbnailUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg',
                  ),
                );
              },
            ),
    );
  }
}
