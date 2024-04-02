import 'package:flutter/material.dart';
import 'package:pro_profile/core/pro_profile_export.dart';

class AppbarTrailingImage extends StatelessWidget {
  const AppbarTrailingImage(
      {super.key, this.imagePath, this.margin, this.onTap});

  final String? imagePath;
  final EdgeInsetsGeometry? margin;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: ProProfileImageView(
            imagePath: imagePath, height: 15.0, fit: BoxFit.contain),
      ),
    );
  }
}
