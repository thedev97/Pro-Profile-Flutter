import 'package:pro_profile/core/pro_profile_export.dart';
import 'package:pro_profile/core/utils/pro_profile_string.dart';

class ProProfileHeaderDrawer extends StatefulWidget {
  const ProProfileHeaderDrawer({super.key});

  @override
  ProProfileHeaderDrawerState createState() => ProProfileHeaderDrawerState();
}

class ProProfileHeaderDrawerState extends State<ProProfileHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: ProProfileDecoration.drawerHeaderDecoration1,
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Neumorphic(
            style: ProProfileDecoration.drawerDecoration,
            child: Container(
              height: 100,
              width: 100,
              decoration: ProProfileDecoration.drawerHeaderDecoration,
            ),
          ),
          const SizedBox(height: 10),
          Text("Alexa Mclaren",
              style: theme.textTheme.titleMedium!.copyWith(fontSize: 20)),
          Text(ProProfileStrings.email,
              style: theme.textTheme.titleMedium!.copyWith(fontSize: 16)),
        ],
      ),
    );
  }
}
