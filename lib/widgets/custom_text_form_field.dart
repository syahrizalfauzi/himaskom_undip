import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextFormField extends HookWidget {
  final bool dense;
  final String? hintText;
  final bool? multiline;
  final int? minLength;
  final int? maxLength;
  final void Function()? onTap;
  final void Function(String)? onSubmit;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final String? labelText;
  final String? tipText;
  final void Function(String)? onChange;
  final TextEditingController? controller;
  final bool useBorder;

  const CustomTextFormField({
    Key? key,
    this.dense = false,
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
    this.onChange,
    this.controller,
    this.useBorder = true,
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
          decoration: InputDecoration(
            filled: true,
            hintText: hintText,
            fillColor: Colors.white,
            contentPadding:
                dense ? const EdgeInsets.fromLTRB(8, 0, 8, 0) : null,
            hintStyle: TextStyle(
                color: dense || !useBorder
                    ? Theme.of(context).disabledColor
                    : const Color(0xFFB4C9E9)),
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
            suffixIcon: textInputType == TextInputType.visiblePassword
                ? IconButton(
                    color: _obscureText.value
                        ? const Color(0xFFB4C9E9)
                        : const Color(0xFFB4C9E9),
                    onPressed: () => _obscureText.value = !_obscureText.value,
                    icon: Icon(
                      _obscureText.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  )
                : null,
          ),
          obscureText: textInputType == TextInputType.visiblePassword
              ? _obscureText.value
              : false,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          minLines: (multiline ?? false) ? 3 : 1,
          maxLines: (multiline ?? false) ? 5 : 1,
          maxLength: maxLength,
          readOnly: onTap != null,
          onTap: onTap,
          onFieldSubmitted: onSubmit,
          onChanged: onChange,
          controller: controller,
          validator: (v) {
            if (minLength != null && v != null && v.length < minLength!) {
              return 'Jumlah karakter kurang dari $minLength';
            }
            if (validator != null) {
              return validator!(v);
            }

            return null;
          },
        ),
      ],
    );
  }
}
