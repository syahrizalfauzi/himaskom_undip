import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextFormField extends HookWidget {
  final String? hintText;
  final bool? multiline;
  final int? minLength;
  final int? maxLength;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final String? labelText;
  final String? tipText;

  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.multiline,
    this.minLength,
    this.maxLength,
    this.onTap,
    this.validator,
    this.textInputAction,
    this.textInputType,
    this.labelText,
    this.tipText,
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
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFFB4C9E9)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Color(0xFFDFE8F6)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Color(0xFFDFE8F6)),
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
