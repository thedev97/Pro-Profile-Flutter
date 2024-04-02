import 'package:pro_profile/core/pro_profile_export.dart';
import 'package:pro_profile/core/utils/pro_profile_string.dart';
import 'package:pro_profile/widgets/pro_profile_elevated_button.dart';
import 'models/home_model.dart';
import 'package:flutter/material.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(const HomeState(homeModel: HomeModel()))
        ..add(HomeInitialEvent()),
      child: const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAlexaIntroduction(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAlexaIntroduction(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                ProProfileStrings.header,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: ProProfileTextStyles.di.copyWith(
                  height: 1,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 12, right: 12),
              child: Text(
                ProProfileStrings.desc1,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium!.copyWith(
                  height: 1.44,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            ProProfileElevatedButton(
              text: ProProfileStrings.contactMe,
              leftIcon: Container(
                margin: const EdgeInsets.only(right: 15.0),
                child: ProProfileImageView(
                  imagePath: ProProfileImageConstant.imgLock,
                  height: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
