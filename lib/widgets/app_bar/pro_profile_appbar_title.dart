import 'package:flutter/material.dart';
import '../../core/pro_profile_export.dart';

class ProProfileAppBarTitle extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? margin;
  final Function? onTap;

  const ProProfileAppBarTitle(
      {super.key, required this.text, this.margin, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: theme.textTheme.titleLarge!
              .copyWith(color: theme.colorScheme.onPrimaryContainer),
        ),
      ),
    );
  }
}
