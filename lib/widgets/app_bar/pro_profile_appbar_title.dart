import '../../core/pro_profile_export.dart';

class ProProfileAppBarTitle extends StatelessWidget {
  final String text1;
  final String text2;
  final EdgeInsetsGeometry? margin;
  final Function? onTap;

  const ProProfileAppBarTitle(
      {super.key,
      required this.text1,
      required this.text2,
      this.margin,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        children: [
          Text(text1,
              style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onPrimaryContainer, fontSize: 22)),
          const SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(text2,
                style: theme.textTheme.titleLarge!.copyWith(
                    color: Colors.white70, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
