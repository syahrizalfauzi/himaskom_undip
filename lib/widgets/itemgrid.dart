import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/widgets/itemcard.dart';

class ItemGrid extends HookWidget {
  final String fetchUrl;

  const ItemGrid({
    Key? key,
    required this.fetchUrl,
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
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ItemCard(
                  judul:
                      '[Jenis] Article Nomor $index Tapi Super Duper Panjang Kayak Gimana Gitu Ya SAD ASD ASD ASD ADS ASD ASD ASD ',
                  id: index.toString(),
                  harga: 25000 * (index + 1),
                  thumbnailUrl:
                      'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg',
                );
              },
            ),
    );
  }
}
