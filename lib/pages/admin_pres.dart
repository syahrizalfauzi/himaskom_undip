import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state_item.dart';
import 'package:himaskom_undip/widgets/admin_scaffold.dart';

class AdminPresentational extends StatelessWidget {
  final Function(Article) onTapArticle;
  final Function(Article) onDeleteArticle;
  final Function() onLogOut;
  final List<ArticleStateItem> items;

  const AdminPresentational({
    Key? key,
    required this.onTapArticle,
    required this.onDeleteArticle,
    required this.onLogOut,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      title: 'Home',
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 24,
                    right: 24,
                    bottom: index == 9 ? 16 : 0,
                  ),
                  child: Card(
                    elevation: 10,
                    shadowColor: const Color(0x328D92AB),
                    child: InkWell(
                      onTap: items[index].onTap,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                items[index].title,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(48),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: onLogOut,
                child: Text(
                  'Log Out',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
