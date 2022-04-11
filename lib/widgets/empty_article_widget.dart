import 'package:flutter/material.dart';

class EmptyArticleWidget extends StatelessWidget {
  const EmptyArticleWidget({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onRefresh,
      child: const Center(
        child: Text(
          'Belum ada article / item\nTap untuk refresh',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
