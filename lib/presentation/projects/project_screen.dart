import 'package:pro_profile/core/pro_profile_export.dart';
import 'package:pro_profile/core/utils/pro_profile_string.dart';
import 'package:pro_profile/presentation/projects/bloc/project_bloc.dart';
import 'package:pro_profile/widgets/app_bar/pro_profile_app_bar.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProjectBloc>(
      create: (context) => ProjectBloc(const ProjectState()),
      child: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          return _buildProject(context, state);
        },
      ),
    );
  }

  Widget _buildProject(BuildContext context, ProjectState state) {
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
                  'My Projects'.toUpperCase(),
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

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return ProProfileAppBar(
      isDefaultStyle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _backButton(context),
          const SizedBox(width: 12),
          Text('Project',
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

  Widget _buildProfileExperience(BuildContext context, ProjectState state) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProjectList(context, state),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProjectListDetails(context),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: NeumorphicButton(
                  onPressed: () {},
                  style: ProProfileDecoration.iconButtonDecoration,
                  child: const Icon(Icons.add, color: Colors.white, size: 25)),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildProjectList(BuildContext context, ProjectState state) {
    final List<Map<String, dynamic>> projects = [
      {'imagePath': ProProfileImageConstant.files, 'title': 'NeuraDrive'},
      {'imagePath': ProProfileImageConstant.files, 'title': 'MobileDriveAI'},
      {'imagePath': ProProfileImageConstant.files, 'title': 'CUDA Mobile'},
      {'imagePath': ProProfileImageConstant.files, 'title': 'IBM AI Mobile'}
    ];

    return EasyStepper(
      alignment: Alignment.centerLeft,
      direction: Axis.vertical,
      activeStep: state.activeStep,
      lineStyle: LineStyle(
          activeLineColor: Colors.lime,
          lineLength: 80,
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
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      steps: List.generate(projects.length, (index) {
        final experience = projects[index];
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
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
              textAlign: TextAlign.center),
        );
      }),
    );
  }

  Widget _buildProjectListDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProjectItem(
            context,
            "Nvidia",
            "Nvidia",
            ProProfileImageConstant.nvidia,
            "2024-Present",
            ProProfileStrings.desc2),
        _buildProjectItem(
            context,
            "Tesla",
            "Nvidia",
            ProProfileImageConstant.tesla,
            "2022-2024",
            ProProfileStrings.desc1),
        _buildProjectItem(context, "IBM", "Tesla", ProProfileImageConstant.ibm,
            "2021-2022", ProProfileStrings.desc1),
        _buildProjectItem(context, "IBM", "IBM", ProProfileImageConstant.ibm,
            "2020-2021", ProProfileStrings.desc1),
      ],
    );
  }

  Widget _buildProjectItem(BuildContext context, String companyName,
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
