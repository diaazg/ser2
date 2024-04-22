import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/auth/data/repos/auth_repo_imp.dart';
import 'package:ser2/features/auth/presentation/logic/box_bloc.dart';
import 'package:ser2/features/auth/presentation/views/add_info.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.size,
    required this.emailBloc,
    required this.passwordBloc,
    required this.formkey,
    required this.usernameBloc,
    required this.checkPassword,
  });

  final Size size;
  final GlobalKey<FormState> formkey;
  final BoxBloc emailBloc;
  final BoxBloc passwordBloc;
  final BoxBloc usernameBloc;
  final BoxBloc checkPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.3,
      decoration: BoxDecoration(
          color: const Color(0xFF6694F6),
          borderRadius: BorderRadius.circular(25)),
      child: TextButton(
          onPressed: () {
            usernameBloc.validateUserName();
            emailBloc.validateEmail();
            passwordBloc.validatePassword();
            checkPassword.checkPassword(passwordBloc.input);
            Future.delayed(const Duration(milliseconds: 100), ()async {
              if (formkey.currentState!.validate()) {
             
            
                BoxBloc townBox = BoxBloc();
                townBox.setWilayaList();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InfoPage(
                            email: emailBloc.input,
                            username: usernameBloc.input,
                            password: passwordBloc.input, townBox: townBox,)));
              } else {
                print('Noo');
              }
            });
          },
          child: Text('Register',
              style: Kcolors.fontMain
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w900))),
    );
  }
}
