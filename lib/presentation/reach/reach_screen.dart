import 'package:pro_profile/core/pro_profile_export.dart';
import 'package:pro_profile/presentation/reach/bloc/reach_bloc.dart';
import 'package:pro_profile/widgets/app_bar/pro_profile_app_bar.dart';
import 'package:pro_profile/widgets/pro_profile_text_form.dart';

class ReachMeScreen extends StatelessWidget {
  const ReachMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReachBloc>(
      create: (context) => ReachBloc(const ReachState()),
      child: BlocBuilder<ReachBloc, ReachState>(
        builder: (context, state) {
          return _buildReachMe(context, state);
        },
      ),
    );
  }

  Widget _buildReachMe(BuildContext context, ReachState state) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(height: 20),
              _reachMeList(context)
            ],
          )
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
          Text('Reach Me',
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

  Widget _reachMeList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Neumorphic(
        style: ProProfileDecoration.normalNeumorphicDecoration,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              const ProProfileTextFormField(label: 'Email'),
              const SizedBox(height: 20),
              const ProProfileTextFormField(label: 'Phone Number'),
              const SizedBox(height: 20),
              const ProProfileTextFormField(label: 'Message'),
              const SizedBox(height: 30),
              NeumorphicButton(
                  onPressed: () {},
                  style: ProProfileDecoration.iconButtonDecoration,
                  child: Text(
                    'Submit',
                    style: theme.textTheme.titleMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    )
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
