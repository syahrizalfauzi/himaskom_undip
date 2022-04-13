import 'package:flutter/material.dart';

class LabeledIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final void Function() onTap;

  const LabeledIcon({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(42),
          onTap: onTap,
          child: AspectRatio(
            aspectRatio: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: Theme.of(context).disabledColor,
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).disabledColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
