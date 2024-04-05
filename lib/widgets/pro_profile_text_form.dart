import 'package:pro_profile/core/pro_profile_export.dart';

class ProProfileTextFormField extends StatelessWidget {
  final String label;

  const ProProfileTextFormField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: ProProfileDecoration.textDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label,
            labelStyle: theme.textTheme.titleSmall!.copyWith(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black45),
          ),
        ),
      ),
    );
  }
}
