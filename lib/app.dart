import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/appView.dart';
import 'package:ser2/features/auth/data/repos/auth_repo_imp.dart';
import 'package:ser2/features/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:ser2/features/auth/presentation/logic/mainAuthBloc/main_auth_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.authRepo});
  final AuthRepoImp authRepo;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthBloc>(create: (_)=>AuthBloc(authRepo)),
      RepositoryProvider<MainAuthBloc>(
        create: (_) => MainAuthBloc(authRepo)),
    ], child:  const MaterialApp(
      title: 'Flutter Demo',
      home:  AppView(),
    ));
  }
}
