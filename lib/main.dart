import 'package:pro_profile/core/pro_profile_export.dart';
import 'package:pro_profile/core/utils/pro_profile_string.dart';
import 'package:pro_profile/presentation/about/bloc/about_bloc.dart';
import 'package:pro_profile/presentation/client/bloc/clients_bloc.dart';
import 'package:pro_profile/presentation/experience/bloc/experience_bloc.dart';
import 'package:pro_profile/presentation/projects/bloc/project_bloc.dart';
import 'package:pro_profile/presentation/reach/bloc/reach_bloc.dart';
import 'package:pro_profile/presentation/resume/bloc/resume_bloc.dart';
import 'presentation/home/bloc/home_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
              create: (context) => HomeBloc(const HomeState())),
          BlocProvider<ExperienceBloc>(
              create: (context) => ExperienceBloc(const ExperienceState())),
          BlocProvider<ClientsBloc>(
              create: (context) => ClientsBloc(const ClientsState())),
          BlocProvider<ProjectBloc>(
              create: (context) => ProjectBloc( const ProjectState())),
          BlocProvider<ResumeBloc>(
              create: (context) => ResumeBloc(const ResumeState())),
          BlocProvider<ReachBloc>(
              create: (context) => ReachBloc(const ReachState())),
          BlocProvider<AboutBloc>(
              create: (context) => AboutBloc(const AboutState()))
        ],
        child: MaterialApp(
          theme: theme,
          title: ProProfileStrings.appTitle,
          debugShowCheckedModeBanner: false,
          initialRoute: ProProfileRoutes.initialRoute,
          routes: ProProfileRoutes.routes
        ));
  }
}
