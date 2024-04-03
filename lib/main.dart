import 'package:pro_profile/core/pro_profile_export.dart';
import 'package:pro_profile/core/utils/pro_profile_string.dart';
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
        BlocProvider<ThemeBloc>(
            create: (context) =>
                ThemeBloc(ThemeState(themeType: ThemeManager.getThemeData()))),
        BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(const HomeState())),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: theme,
            title: ProProfileStrings.appTitle,
            debugShowCheckedModeBanner: false,
            initialRoute: ProProfileRoutes.initialRoute,
            routes: ProProfileRoutes.routes,
          );
        },
      ),
    );
  }
}
