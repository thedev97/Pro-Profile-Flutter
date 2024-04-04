import 'package:pro_profile/core/pro_profile_export.dart';
import 'package:pro_profile/core/utils/pro_profile_string.dart';
import 'package:pro_profile/presentation/client/bloc/clients_bloc.dart';
import 'package:pro_profile/widgets/app_bar/pro_profile_app_bar.dart';

class ClientScreen extends StatelessWidget {
  const ClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ClientsBloc>(
      create: (context) => ClientsBloc(const ClientsState()),
      child: BlocBuilder<ClientsBloc, ClientsState>(
        builder: (context, state) {
          return _buildClient(context, state);
        },
      ),
    );
  }

  Widget _buildClient(BuildContext context, ClientsState state) {
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
          Text('Clients',
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
}
