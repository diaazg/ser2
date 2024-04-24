import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/widgets/nav_bar.dart';
import 'package:ser2/features/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:ser2/features/auth/presentation/logic/mainAuthBloc/main_auth_bloc.dart';
import 'package:ser2/features/auth/presentation/logic/mainAuthBloc/main_auth_state.dart';
import 'package:ser2/features/auth/presentation/views/login_page.dart';
import 'package:ser2/features/splash/presentation/views/splash_screen.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainAuthBloc, MainAuthState>(builder: (context, state) {
      if (state.status == MainAuthStatus.authentificated) {
        return MultiBlocProvider(
          providers: [
          BlocProvider(
              create: (context) =>
                  AuthBloc(context.read<MainAuthBloc>().authRepo))
        ], child: const NavBar());
      } else {
        return BlocProvider<AuthBloc>(
												create: (context) => AuthBloc(context.read<MainAuthBloc>().authRepo),
                        child:  SplashScreen()
        );
      }
    });
  }
}
