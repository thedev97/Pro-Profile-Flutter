import 'package:flutter/material.dart';
import 'package:pro_profile/theme/theme_helper.dart';

class ProProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProProfileAppBar(
      {super.key,
      this.height,
      this.styleType,
      this.leadingWidth,
      this.leading,
      this.title,
      this.centerTitle,
      this.actions,
      this.width});

  final double? height;
  final double? width;
  final Style? styleType;
  final double? leadingWidth;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 70.0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(width ?? 70.0, height ?? 70.0);

  Widget? _getStyle() {
    switch (styleType) {
      case Style.bgFill:
        return Container(
          height: 70,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
          ),
        );
      default:
        return null;
    }
  }
}

enum Style { bgFill }
