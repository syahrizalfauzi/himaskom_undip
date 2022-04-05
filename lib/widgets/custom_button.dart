import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final String? text;
  final bool loading;
  final bool dense;

  const CustomButton({
    Key? key,
    required this.onTap,
    this.text,
    this.loading = false,
    this.dense = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: loading ? null : onTap,
      color: Theme.of(context).primaryColor,
      disabledColor: Theme.of(context).primaryColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: dense ? 8 : 16,
      ),
      child: loading
          ? const SizedBox(
              height: 17,
              width: 17,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : text != null
              ? Text(
                  text!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
    );
  }
}
