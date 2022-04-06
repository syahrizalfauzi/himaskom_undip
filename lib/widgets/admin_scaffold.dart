import 'package:flutter/material.dart';

class AdminScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final void Function()? onTapFab;

  const AdminScaffold({
    Key? key,
    required this.title,
    required this.child,
    this.onTapFab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: child,
      floatingActionButton: onTapFab != null
          ? FloatingActionButton(
              onPressed: onTapFab,
              child: const Icon(Icons.add),
            )
          : null,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
      ),
    );
  }
}
