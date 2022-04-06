import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article_tab_item.dart';

class AdminHomePagePresentational extends StatelessWidget {
  final List<ArticleTabItem> items;
  final void Function() onLogOut;

  const AdminHomePagePresentational({
    Key? key,
    required this.items,
    required this.onLogOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
