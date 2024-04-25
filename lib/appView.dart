

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/widgets/nav_bar.dart';
import 'package:ser2/features/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:ser2/features/auth/presentation/logic/mainAuthBloc/main_auth_bloc.dart';
import 'package:ser2/features/auth/presentation/logic/mainAuthBloc/main_auth_state.dart';
import 'package:ser2/features/doctors/data/repos/doctors_repo_imp.dart';
import 'package:ser2/features/homePage/presentation/logic/allDoctorsBloc.dart';
import 'package:ser2/features/profile/data/repo/user_repo_imp.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_Event.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_bloc.dart';
import 'package:ser2/features/splash/presentation/views/splash_screen.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainAuthBloc, MainAuthState>(builder: (context, state) {
      if (state.status == MainAuthStatus.authentificated) {
       UserDataBloc bloc = UserDataBloc(userDataRepo: UserDataRepoImp(storeInstance: context.read<MainAuthBloc>().authRepo.storeInstance), uid: state.user!.uid) ;
       bloc.add(GetUserData(uid: state.user!.uid));
        return MultiBlocProvider(
          providers: [
                      BlocProvider(
              create: (context) =>
                  NearbyDoctorsBloc(DoctorsRepoImp(storeInstance: context.read<MainAuthBloc>().authRepo.storeInstance))),
          BlocProvider(
              create: (context) =>
                  AuthBloc(context.read<MainAuthBloc>().authRepo)),
                 
        ], child:  NavBar(bloc:bloc,));
      } else {
        return BlocProvider<AuthBloc>(
												create: (context) => AuthBloc(context.read<MainAuthBloc>().authRepo),
                        child:  SplashScreen()
        );
      }
    });
  }
}
