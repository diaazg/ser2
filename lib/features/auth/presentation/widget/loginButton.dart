import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/utiles/error_hnadler.dart';
import 'package:ser2/core/widgets/nav_bar.dart';
import 'package:ser2/features/auth/data/models/user_model.dart';
import 'package:ser2/features/auth/data/repos/auth_repo_imp.dart';
import 'package:ser2/features/auth/presentation/logic/box_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.size,
    required this.emailBloc,
    required this.passwordBloc,
    required this.formkey,
  });

  final Size size;
  final GlobalKey<FormState> formkey;
  final BoxBloc emailBloc;
  final BoxBloc passwordBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.3,
      decoration: BoxDecoration(
          color: const Color(0xFF6694F6),
          borderRadius: BorderRadius.circular(25)),
      child: TextButton(
          onPressed: () async {
            emailBloc.validateEmail();
            passwordBloc.validatePassword();
            Future.delayed(const Duration(milliseconds: 100), () async {
              if (formkey.currentState!.validate()) {
                FirebaseAuth authInstance = FirebaseAuth.instance;
                  
                FirebaseFirestore storeInstance = FirebaseFirestore.instance;
                AuthRepoImp authRepo = AuthRepoImp(authInstance: authInstance, storeInstance: storeInstance);
                UserModelLog userModel = UserModelLog(email: emailBloc.input,password: passwordBloc.input);
               var response = await authRepo.logIn(userModel);
               response.fold((failure){
                print(failure.errMessage);
               }, (success){
                print(success);
               } );

              
                /* Navigator.push(context, MaterialPageRoute(builder: (context)=>const NavBar())); */
              } else {}
            });
          },
          child: Text('Log_in',
              style: Kcolors.fontMain
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w900))),
    );
  }
}
