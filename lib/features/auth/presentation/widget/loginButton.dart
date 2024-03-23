import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
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
          color: const Color(0xFF6694F6), borderRadius: BorderRadius.circular(25)),
      child: TextButton(
          onPressed: () {
            
            emailBloc.validateEmail();
            passwordBloc.validatePassword();
            Future.delayed(const Duration(milliseconds: 100), () {
              if (formkey.currentState!.validate()) {
                
              } else {
                
                
              }
            });
          },
          child: Text('Log_in',
              style: Kcolors.fontMain
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w900))),
    );
  }
}
