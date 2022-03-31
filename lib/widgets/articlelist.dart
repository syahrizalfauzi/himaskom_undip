import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/widgets/articlecard.dart';
import 'package:himaskom_undip/widgets/articlelistitem.dart';

class ArticleList extends HookWidget {
  final String fetchUrl;
  final bool firstHighlight;

  const ArticleList({
    Key? key,
    required this.fetchUrl,
    this.firstHighlight = false,
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
                Widget child;
                if (index == 0 && firstHighlight) {
                  child = Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ArticleCard(
                        judul:
                            '[Jenis] Article Nomor $index Tapi Super Duper Panjang Kayak Gimana Gitu Ya SAD ASD ASD ASD ADS ASD ASD ASD ',
                        id: index.toString(),
                        createdAt: DateTime.now(),
                        thumbnailUrl:
                            'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg',
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Info Terbaru',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      )
                    ],
                  );
                } else {
                  child = ArticleListItem(
                    judul:
                        '[Jenis] Article Nomor $index Tapi Super Duper Panjang Kayak Gimana Gitu Ya SAD ASD ASD ASD ADS ASD ASD ASD ',
                    id: index.toString(),
                    createdAt: DateTime.now(),
                    thumbnailUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg',
                  );
                }

                return Padding(
                  padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
                  child: child,
                );
              },
            ),
    );
  }
}
