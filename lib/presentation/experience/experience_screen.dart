import 'package:pro_profile/core/pro_profile_export.dart';
import 'package:pro_profile/core/utils/pro_profile_string.dart';
import 'package:pro_profile/presentation/experience/bloc/experience_bloc.dart';
import 'package:pro_profile/widgets/app_bar/pro_profile_app_bar.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExperienceBloc>(
      create: (context) => ExperienceBloc(const ExperienceState()),
      child: BlocBuilder<ExperienceBloc, ExperienceState>(
        builder: (context, state) {
          return _buildExperience(context, state);
        },
      ),
    );
  }

  Widget _buildExperience(BuildContext context, ExperienceState state) {
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'My Experience'.toUpperCase(),
                  style: theme.textTheme.titleMedium!.copyWith(
                      fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
              _buildProfileExperience(context, state)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileExperience(BuildContext context, ExperienceState state) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExperienceList(context, state),
        _buildExperienceListDetails(context)
      ],
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
          Text('Experience',
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
                decoration: ProProfileDecoration.drawerHeaderDecoration),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Alexa Mclaren",
                    maxLines: 2,
                    style: theme.textTheme.titleMedium!.copyWith(fontSize: 30)),
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

  Widget _buildExperienceList(BuildContext context, ExperienceState state) {
    final List<Map<String, dynamic>> experiences = [
      {'imagePath': ProProfileImageConstant.nvidia, 'title': 'Nvidia'},
      {'imagePath': ProProfileImageConstant.tesla, 'title': 'Tesla'},
      {'imagePath': ProProfileImageConstant.ibm, 'title': 'IBM'}
    ];

    return EasyStepper(
      alignment: Alignment.centerLeft,
      direction: Axis.vertical,
      activeStep: state.activeStep,
      lineStyle: LineStyle(
          activeLineColor: Colors.lime,
          lineLength: 75,
          lineThickness: 5,
          lineSpace: 5,
          lineType: LineType.normal,
          defaultLineColor: Colors.white54,
          progress: state.progress),
      borderThickness: 8,
      internalPadding: 15,
      stepShape: StepShape.rRectangle,
      stepBorderRadius: 15,
      activeStepBorderColor: Colors.lime,
      showLoadingAnimation: false,
      steps: List.generate(experiences.length, (index) {
        final experience = experiences[index];
        return EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: state.activeStep >= index ? 1 : 1,
              child: Neumorphic(
                style: ProProfileDecoration.normalNeumorphicDecoration,
                child: ProProfileImageView(
                    imagePath: experience['imagePath'], height: 35, width: 35),
              ),
            ),
          ),
          customTitle: Text(experience['title'],
              style: theme.textTheme.titleMedium!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center),
        );
      }),
    );
  }

  Widget _buildExperienceListDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExperienceItem(
            context,
            "Nvidia",
            "Software Consultant",
            ProProfileImageConstant.nvidia,
            "2023-Present",
            ProProfileStrings.desc2),
        _buildExperienceItem(
            context,
            "Tesla",
            "System Engineering",
            ProProfileImageConstant.tesla,
            "2022-2023",
            ProProfileStrings.desc1),
        _buildExperienceItem(context, "IBM", "Software Engineering",
            ProProfileImageConstant.ibm, "2020-2022", ProProfileStrings.desc1),
      ],
    );
  }

  Widget _buildExperienceItem(BuildContext context, String companyName,
      String position, String imagePath, String duration, String description) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(duration,
              style: theme.textTheme.titleSmall!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white54)),
          const SizedBox(height: 5),
          Text(position,
              style: theme.textTheme.titleMedium!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          const SizedBox(height: 2),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.38,
              child: Text(description,
                  style: theme.textTheme.titleMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white54),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10)),
          const SizedBox(height: 15)
        ],
      ),
    );
  }
}
