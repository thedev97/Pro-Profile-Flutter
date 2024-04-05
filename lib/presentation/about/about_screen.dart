import 'package:pro_profile/core/pro_profile_export.dart';
import 'package:pro_profile/core/utils/pro_profile_string.dart';
import 'package:pro_profile/presentation/about/bloc/about_bloc.dart';
import 'package:pro_profile/widgets/app_bar/pro_profile_app_bar.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AboutBloc>(
      create: (context) => AboutBloc(const AboutState()),
      child: BlocBuilder<AboutBloc, AboutState>(
        builder: (context, state) {
          return _buildAboutMe(context, state);
        },
      ),
    );
  }

  Widget _buildAboutMe(BuildContext context, AboutState state) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: _buildDragAboutMe(context),
      ),
    );
  }

  Widget _buildDragAboutMe(BuildContext context) {
    return DraggableHome(
      title: const Text(''),
      headerWidget: _headerWidget(context),
      fullyStretchable: true,
      body: [_buildHeader(context)],
      alwaysShowLeadingAndAction: false,
      backgroundColor: theme.colorScheme.onSecondary,
      appBarColor: Colors.transparent,
    );
  }

  Widget _headerWidget(BuildContext context) {
    return Container(
      color: theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ProProfileImageView(
                    imagePath: ProProfileImageConstant.quotes1,
                    height: 50,
                    width: 45),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 10),
                  child: Text(
                    'Hi'.toUpperCase(),
                    style: theme.textTheme.titleLarge!.copyWith(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 47, top: 12),
                  child: Text(
                    'Alexa Maclaren'.toUpperCase(),
                    style: theme.textTheme.titleLarge!.copyWith(
                        fontSize: 30,
                        color: appTheme.brown200,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(width: 10),
                ProProfileImageView(
                    imagePath: ProProfileImageConstant.quotes2,
                    height: 50,
                    width: 45),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Software Engineer".toUpperCase(),
                  style: theme.textTheme.titleMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                NeumorphicButton(
                    onPressed: () {},
                    style: ProProfileDecoration.elevatedButtonDecoration1,
                    child: Text(
                      'Download Resume',
                      style: theme.textTheme.titleMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white70),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return ProProfileAppBar(
      isDefaultStyle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _backButton(context),
          const SizedBox(width: 12),
          Text('About Me',
              style: theme.textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500))
        ],
      ),
      styleType: Style.bgFill,
    );
  }

  Widget _backButton(BuildContext context) {
    return NeumorphicButton(
        padding: const EdgeInsets.all(8),
        onPressed: () => Navigator.pop(context),
        style: ProProfileDecoration.backButtonDecoration,
        child: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black));
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Neumorphic(
            style: ProProfileDecoration.drawerDecoration,
            child: Container(
              height: 200,
              width: 150,
              decoration: ProProfileDecoration.drawerHeaderDecoration,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Alexa Mclaren",
                  maxLines: 2,
                  style: theme.textTheme.titleMedium!.copyWith(fontSize: 30),
                ),
                const SizedBox(height: 5),
                Text(
                  "Software Engineer".toUpperCase(),
                  style: theme.textTheme.titleMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: appTheme.brown200),
                ),
                const SizedBox(height: 10),
                Text(
                  ProProfileStrings.desc3,
                  maxLines: 5,
                  style: theme.textTheme.titleSmall!.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
