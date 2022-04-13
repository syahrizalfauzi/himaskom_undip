import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextFormField extends HookWidget {
  final bool dense;
  final bool useBorder;
  final bool disabled;
  final bool filled;
  final bool autofocus;
  final String? hintText;
  final bool? multiline;
  final int? minLength;
  final int? maxLength;
  final void Function()? onTap;
  final void Function(String)? onSubmit;
  final String? Function(String)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final String? labelText;
  final String? tipText;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  const CustomTextFormField({
    Key? key,
    this.dense = false,
    this.useBorder = true,
    this.disabled = false,
    this.filled = true,
    this.autofocus = false,
    this.hintText,
    this.multiline,
    this.minLength,
    this.maxLength,
    this.onTap,
    this.onSubmit,
    this.validator,
    this.textInputAction,
    this.textInputType,
    this.labelText,
    this.tipText,
    this.controller,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _obscureText = useState(true);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (labelText != null)
              Text(labelText!, style: Theme.of(context).textTheme.bodyLarge),
            if (tipText != null)
              Text(tipText!, style: Theme.of(context).textTheme.caption),
          ],
        ),
        if (labelText != null || tipText != null) const SizedBox(height: 18),
        TextFormField(
          textInputAction: textInputAction,
          keyboardType: textInputType,
          minLines: (multiline ?? false) ? 3 : 1,
          maxLines: (multiline ?? false) ? 5 : 1,
          maxLength: maxLength,
          readOnly: onTap != null,
          onTap: onTap,
          onFieldSubmitted: onSubmit,
          controller: controller,
          autofocus: autofocus,
          decoration: InputDecoration(
            enabled: !disabled,
            filled: filled,
            fillColor: Colors.white,
            hintText: hintText,
            contentPadding:
                dense ? const EdgeInsets.fromLTRB(8, 0, 8, 0) : null,
            hintStyle: TextStyle(
                color: dense || !useBorder || disabled
                    ? Theme.of(context).disabledColor
                    : const Color(0xFFB4C9E9)),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  color: dense
                      ? Theme.of(context).disabledColor
                      : useBorder
                          ? const Color(0xFFDFE8F6)
                          : Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  color: dense
                      ? Theme.of(context).disabledColor
                      : useBorder
                          ? const Color(0xFFDFE8F6)
                          : Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  color: dense
                      ? Theme.of(context).disabledColor
                      : useBorder
                          ? const Color(0xFFDFE8F6)
                          : Colors.transparent),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.red),
            ),
            suffixIcon: suffixIcon ??
                (textInputType == TextInputType.visiblePassword
                    ? IconButton(
                        color: disabled
                            ? Theme.of(context).disabledColor
                            : _obscureText.value
                                ? const Color(0xFFB4C9E9)
                                : const Color.fromARGB(255, 151, 184, 233),
                        onPressed: () =>
                            _obscureText.value = !_obscureText.value,
                        icon: Icon(
                          _obscureText.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      )
                    : null),
          ),
          obscureText: textInputType == TextInputType.visiblePassword
              ? _obscureText.value
              : false,
          style: TextStyle(
              color: disabled ? Theme.of(context).disabledColor : Colors.black),
          validator: (v) {
            if (minLength != null && v!.length < minLength!) {
              return 'Jumlah karakter kurang dari $minLength';
            }
            if (validator != null) {
              return validator!(v!);
            }

            return null;
          },
        ),
      ],
    );
  }
}
