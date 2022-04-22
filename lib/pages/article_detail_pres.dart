import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/widgets/article_jenis_icon.dart';
import 'package:himaskom_undip/widgets/custom_button.dart';
import 'package:himaskom_undip/widgets/labeled_icon.dart';
import 'package:himaskom_undip/widgets/tab_indicator.dart';
import 'package:intl/intl.dart';
import 'package:loop_page_view/loop_page_view.dart';

class ArticleDetailPagePresentational extends StatelessWidget {
  final LoopPageController imageController;
  final double currentImageIndex;
  final void Function(int) onTapIndicator;
  final Article? article;
  final Future<void> Function() onRefresh;
  final void Function() onHubungi;
  final void Function() onSimpan;
  final void Function() onBagikan;
  final void Function() onPengingat;

  const ArticleDetailPagePresentational({
    Key? key,
    required this.imageController,
    required this.currentImageIndex,
    required this.onTapIndicator,
    required this.onRefresh,
    required this.onHubungi,
    required this.onSimpan,
    required this.onBagikan,
    required this.onPengingat,
    this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: article == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: onRefresh,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Row(
                            children: [
                              ArticleJenisIcon(jenis: article!.jenis),
                              const SizedBox(width: 12),
                              Text(
                                article!.jenisString,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const Spacer(),
                              Text(
                                DateFormat('dd MMM y')
                                    .format(article!.createdAt!),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFB4B3BA),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
                          child: Text(
                            article!.judul,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.symmetric(
                              horizontal: BorderSide(
                                color: Theme.of(context)
                                    .disabledColor
                                    .withOpacity(0.2),
                              ),
                            ),
                          ),
                          child: LoopPageView.builder(
                            itemCount: article!.gambarUrl!.length,
                            controller: imageController,
                            physics: article!.gambarUrl!.length > 1
                                ? const AlwaysScrollableScrollPhysics()
                                : const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) {
                              return Image.network(
                                article!.gambarUrl![index],
                                fit: BoxFit.contain,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        TabIndicator(
                          length: article!.gambarUrl!.length,
                          currentIndex: currentImageIndex,
                          onTapIndicator: onTapIndicator,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(
                            article!.deskripsi!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x328D92AB),
                        offset: Offset(0, -1),
                        blurRadius: 53,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: (article!.variant == PostVariant.article ||
                                article!.variant == PostVariant.event)
                            ? 0
                            : 18),
                    child: Row(
                      mainAxisAlignment: article!.variant == PostVariant.item
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.spaceAround,
                      children: [
                        if (article!.variant == PostVariant.article ||
                            article!.variant == PostVariant.event) ...[
                          LabeledIcon(
                            icon: article!.isSaved
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            label: article!.isSaved ? "Tersimpan" : "Simpan",
                            onTap: onSimpan,
                          ),
                          if (article!.variant == PostVariant.event &&
                              article!.tenggat!.isAfter(DateTime.now()))
                            LabeledIcon(
                              icon: Icons.watch_later_outlined,
                              label: "Pengingat",
                              onTap: onPengingat,
                            ),
                          LabeledIcon(
                            icon: Icons.ios_share,
                            label: "Bagikan",
                            onTap: onBagikan,
                          )
                        ],
                        if (article!.variant == PostVariant.item) ...[
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Harga',
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text(
                                NumberFormat.currency(
                                  locale: 'id_ID',
                                  symbol: "Rp. ",
                                  decimalDigits: 0,
                                ).format(article!.harga),
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )
                            ],
                          ),
                          const SizedBox(width: 42),
                          Expanded(
                            child: CustomButton(
                              onTap: onHubungi,
                              text: 'Hubungi Sistore',
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
