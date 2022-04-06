import 'package:flutter/material.dart';

class UserScaffold extends StatelessWidget {
  final String title;
  final void Function() onTapSearch;
  final Widget child;

  const UserScaffold({
    Key? key,
    required this.title,
    required this.onTapSearch,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: onTapSearch,
            icon: const Icon(Icons.search),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: child,
    );
  }
}
