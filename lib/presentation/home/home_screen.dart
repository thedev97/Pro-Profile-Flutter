import 'package:pro_profile/core/pro_profile_export.dart';
import 'package:pro_profile/core/utils/pro_profile_string.dart';
import 'package:pro_profile/presentation/resume/resume_screen.dart';
import 'package:pro_profile/widgets/app_bar/pro_profile_app_bar.dart';
import 'package:pro_profile/widgets/app_bar/pro_profile_appbar_title.dart';
import 'package:pro_profile/widgets/drawer/drwaer_header.dart';
import 'package:pro_profile/widgets/pro_profile_elevated_button.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(const HomeState()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.featuredImages.isEmpty && state.projectImages.isEmpty) {
            BlocProvider.of<HomeBloc>(context).add(HomeInitialEvent());
          }
          return _buildHome(context, state);
        },
      ),
    );
  }

  Widget _buildHome(BuildContext context, HomeState state) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElasticDrawer(
            drawerColor: Colors.white12,
            mainColor: Colors.transparent,
            mainChild: ListView(
              children: [
                _buildProfile(context),
                _featuredWork(context, state),
                _learnMore(context),
                const SizedBox(height: 20),
                _personalProjects(context, state),
                _contactMe(context),
                _contact(context)
              ],
            ),
            drawerChild: _buildDrawer(context),
          ),
        ),
      ),
    );
  }

  Widget _buildProfile(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          ProProfileImageView(imagePath: ProProfileImageConstant.bannerProfile),
          Stack(
            alignment: Alignment.center,
            children: [
              ProProfileImageView(
                  height: MediaQuery.of(context).size.height * 0.38,
                  imagePath: ProProfileImageConstant.banner,
                  width: double.infinity),
              _buildHeader(context),
            ],
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return ProProfileAppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProProfileImageView(
              imagePath: ProProfileImageConstant.logo,
              height: 40,
              alignment: Alignment.topCenter),
          const SizedBox(width: 12),
          const ProProfileAppBarTitle(
              text1: ProProfileStrings.appTitle1,
              text2: ProProfileStrings.appTitle2)
        ],
      ),
      styleType: Style.bgFill,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(ProProfileStrings.header,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: ProProfileTextStyles.displaySmall),
          const SizedBox(height: 15),
          Text(ProProfileStrings.desc1,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium!.copyWith(height: 1.2)),
          const SizedBox(height: 30.0),
          ProProfileElevatedButton(
            text: ProProfileStrings.contactMe,
            leftIcon: Container(
                margin: const EdgeInsets.only(right: 15.0),
                child: ProProfileImageView(
                    imagePath: ProProfileImageConstant.contact, height: 15.0)),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const ProProfileHeaderDrawer(),
                _buildDrawerListTile(context, 'Home', () {
                  ElasticDrawerKey.drawer.currentState
                      ?.closeElasticDrawer(context);
                }),
                _buildDrawerListTile(context, 'Experience', () {
                  ElasticDrawerKey.drawer.currentState
                      ?.closeElasticDrawer(context);
                  ElasticDrawerKey.navigator.currentState?.push(
                    MaterialPageRoute(
                        builder: (context) => const ResumeScreen()),
                  );
                }),
                _buildDrawerListTile(context, 'Clients', () {
                  ElasticDrawerKey.drawer.currentState
                      ?.closeElasticDrawer(context);
                  ElasticDrawerKey.navigator.currentState?.push(
                    MaterialPageRoute(
                        builder: (context) => const ResumeScreen()),
                  );
                }),
                _buildDrawerListTile(context, 'Recent Work', () {
                  ElasticDrawerKey.drawer.currentState
                      ?.closeElasticDrawer(context);
                  ElasticDrawerKey.navigator.currentState?.push(
                    MaterialPageRoute(
                        builder: (context) => const ResumeScreen()),
                  );
                }),
                _buildDrawerListTile(context, 'Resume', () {
                  ElasticDrawerKey.drawer.currentState
                      ?.closeElasticDrawer(context);
                  ElasticDrawerKey.navigator.currentState?.push(
                    MaterialPageRoute(
                        builder: (context) => const ResumeScreen()),
                  );
                }),
                _buildDrawerListTile(context, 'Reach Me', () {
                  ElasticDrawerKey.drawer.currentState
                      ?.closeElasticDrawer(context);
                  ElasticDrawerKey.navigator.currentState?.push(
                    MaterialPageRoute(
                        builder: (context) => const ResumeScreen()),
                  );
                }),
                _buildDrawerListTile(context, 'About Me', () {
                  ElasticDrawerKey.drawer.currentState
                      ?.closeElasticDrawer(context);
                  ElasticDrawerKey.navigator.currentState?.push(
                    MaterialPageRoute(
                        builder: (context) => const ResumeScreen()),
                  );
                }),
                _buildDrawerListTile(context, 'Logout', () {
                  ElasticDrawerKey.drawer.currentState
                      ?.closeElasticDrawer(context);
                  ElasticDrawerKey.navigator.currentState?.push(
                    MaterialPageRoute(
                        builder: (context) => const ResumeScreen()),
                  );
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Version 1.0',
              style: theme.textTheme.titleSmall!.copyWith(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerListTile(
      BuildContext context, String title, void Function()? onTap) {
    return ListTile(
        title: Text(title,
            style: theme.textTheme.titleSmall!.copyWith(fontSize: 14)),
        trailing: const Icon(Icons.arrow_forward_ios_outlined,
            size: 18, color: Colors.black54),
        onTap: onTap);
  }

  Widget _featuredWork(BuildContext context, HomeState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              ProProfileImageView(
                  imagePath: ProProfileImageConstant.downArrow, height: 24),
              const SizedBox(width: 10),
              Text(
                ProProfileStrings.featuredWork.toUpperCase(),
                style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.featuredImages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                mainAxisExtent: MediaQuery.of(context).size.height / 6),
            itemBuilder: (context, index) {
              return Neumorphic(
                style: ProProfileDecoration.featuredDecoration,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(state.featuredImages[index]),
                        fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _personalProjects(BuildContext context, HomeState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Projects',
            style: theme.textTheme.titleMedium!.copyWith(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.projectImages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                mainAxisExtent: MediaQuery.of(context).size.height / 3.5),
            itemBuilder: (context, index) {
              return Neumorphic(
                style: ProProfileDecoration.featuredDecoration,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(state.projectImages[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _learnMore(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: ProProfileDecoration.learMoreDecoration,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ProProfileStrings.whyMe.toUpperCase(),
                style: theme.textTheme.titleSmall!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.white70)),
            const SizedBox(height: 8),
            Flexible(
              child: Text(ProProfileStrings.desc1,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium!.copyWith(
                      height: 1.2, fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 15.0),
            ProProfileElevatedButton(
              text: ProProfileStrings.learnMore,
              width: 150,
              height: 50,
              buttonTextStyle: theme.textTheme.titleMedium!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactMe(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: ProProfileDecoration.contactMeDecoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(ProProfileStrings.contactMe,
                  style: theme.textTheme.titleSmall!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white)),
              const SizedBox(height: 8),
              Flexible(
                child: Text(ProProfileStrings.desc1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium!.copyWith(
                        height: 1.2,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
              const SizedBox(height: 15.0),
              ProProfileElevatedButton(
                  text: ProProfileStrings.email,
                  width: MediaQuery.of(context).size.width * 0.65,
                  leftIcon: Container(
                      margin: const EdgeInsets.only(right: 15.0),
                      child: ProProfileImageView(
                          imagePath: ProProfileImageConstant.contact,
                          height: 15.0))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contact(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var imagePath in ProProfileHelper.contactImages)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child:
                      ProProfileImageView(imagePath: imagePath, height: 15.0),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildContactText(
                    ProProfileStrings.copyRightMsg, FontWeight.w500),
                const SizedBox(width: 5),
                _buildContactText(ProProfileStrings.email, FontWeight.w700),
                _buildContactText(
                    ProProfileStrings.copyright2024, FontWeight.w500)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactText(String text, FontWeight weight) {
    return Text(
      text,
      style: theme.textTheme.titleSmall!.copyWith(
        fontSize: 14,
        fontWeight: weight,
        color: Colors.white,
      ),
    );
  }
}
