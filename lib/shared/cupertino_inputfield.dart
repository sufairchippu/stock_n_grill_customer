import 'package:flutter/cupertino.dart';

class CupertinoInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? placeholder;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefix;
  final Widget? suffix;
  final Color? color;

  const CupertinoInputField({
    super.key,
    required this.controller,
    this.placeholder,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefix,
    this.suffix,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      obscureText: obscureText,
      keyboardType: keyboardType,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      prefix:
          prefix != null
              ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: prefix,
              )
              : null,
      suffix:
          suffix != null
              ? Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: suffix,
              )
              : null,
      decoration: BoxDecoration(
        color: color ?? CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: CupertinoColors.systemGrey4),
      ),
    );
  }
}
