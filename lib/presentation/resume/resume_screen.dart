import 'package:pro_profile/core/pro_profile_export.dart';
import 'package:pro_profile/core/utils/pro_profile_string.dart';
import 'package:pro_profile/presentation/resume/bloc/resume_bloc.dart';
import 'package:pro_profile/widgets/app_bar/pro_profile_app_bar.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResumeBloc>(
      create: (context) => ResumeBloc(const ResumeState()),
      child: BlocBuilder<ResumeBloc, ResumeState>(
        builder: (context, state) {
          return _buildHome(context, state);
        },
      ),
    );
  }

  Widget _buildHome(BuildContext context, ResumeState state) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              _buildHeader(context),
              const SizedBox(height: 20),
              _profileDetails(context)
            ],
          ),
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
          Text('Resume',
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
      child: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
    );
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

  Widget _profileDetails(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _profileEducationAndContact(),
        _profileExperienceAndSkills(context)
      ],
    );
  }

  Widget _profileEducationAndContact() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileEducation(),
          const SizedBox(height: 15),
          _profileContact(),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _profileEducation() {
    return Neumorphic(
      style: ProProfileDecoration.normalNeumorphicDecoration,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Education".toUpperCase(),
                style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: appTheme.brown200)),
            const SizedBox(height: 15),
            Text("2016-2020",
                style: theme.textTheme.titleSmall!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white54)),
            const SizedBox(height: 5),
            Text("Bachelor of Engineering",
                style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            const SizedBox(height: 2),
            Text("Texas University, USA",
                style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70)),
            const SizedBox(height: 12),
            Text("2014-2016",
                style: theme.textTheme.titleSmall!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white54)),
            const SizedBox(height: 5),
            Text("Grade 12",
                style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            const SizedBox(height: 2),
            Text("Texas High School, USA",
                style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70)),
            const SizedBox(height: 12),
            Text("2003-2012",
                style: theme.textTheme.titleSmall!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white54)),
            const SizedBox(height: 5),
            Text("Grade 10",
                style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            const SizedBox(height: 2),
            Text("Texas School, USA",
                style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  Widget _profileContact() {
    return Neumorphic(
      style: ProProfileDecoration.normalNeumorphicDecoration,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Contact".toUpperCase(),
                style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: appTheme.brown200)),
            const SizedBox(height: 15),
            Text("Phone",
                style: theme.textTheme.titleSmall!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white54)),
            const SizedBox(height: 2),
            Text("+ 01- 2132142323",
                style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            const SizedBox(height: 12),
            Text("Email",
                style: theme.textTheme.titleSmall!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white54)),
            const SizedBox(height: 2),
            Text(ProProfileStrings.email,
                style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            const SizedBox(height: 12),
            Text("Address",
                style: theme.textTheme.titleSmall!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white54)),
            const SizedBox(height: 2),
            Text(
                "Street name, address line 1,\naddress line 2, landmark,\nCity - Zipcode",
                style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _profileExperienceAndSkills(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileExperience(context),
          const SizedBox(height: 15),
          _profileSkills(context),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _profileExperience(BuildContext context) {
    return Neumorphic(
      style: ProProfileDecoration.normalNeumorphicDecoration,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Experience".toUpperCase(),
              style: theme.textTheme.titleMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: appTheme.brown200,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "2023-Present",
              style: theme.textTheme.titleSmall!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Software Consultant",
              style: theme.textTheme.titleMedium!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 2),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                ProProfileStrings.desc2,
                style: theme.textTheme.titleMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "2020-2022",
              style: theme.textTheme.titleSmall!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Software Engineering",
              style: theme.textTheme.titleMedium!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 2),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                ProProfileStrings.desc1,
                style: theme.textTheme.titleMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileSkills(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Neumorphic(
        style: ProProfileDecoration.normalNeumorphicDecoration,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Skills".toUpperCase(),
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: appTheme.brown200
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width *0.42,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 25,
                  ),
                  itemCount: ProProfileHelper.skillsImage.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ProProfileImageView(
                            imagePath: ProProfileHelper.skillsImage[index],
                            height: 35,
                            width: 40,
                            fit: BoxFit.cover),
                        const SizedBox(height: 2),
                        Text(
                          ProProfileHelper.skillText[index],
                          style: theme.textTheme.titleMedium!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: appTheme.white,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
