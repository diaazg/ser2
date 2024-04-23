import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/widgets/nav_bar.dart';
import 'package:ser2/features/auth/presentation/logic/mainAuthBloc/main_auth_bloc.dart';
import 'package:ser2/features/auth/presentation/logic/mainAuthBloc/main_auth_state.dart';
import 'package:ser2/features/splash/presentation/views/splash_screen.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainAuthBloc,MainAuthState>(
      builder: (context,state){
        if(state.status == MainAuthStatus.unauthenticated){
          return const SplashScreen();
        }else{
          return const NavBar();
        }
      });
  }
}