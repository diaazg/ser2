
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/auth/data/models/user_model.dart';
import 'package:ser2/features/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:ser2/features/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:ser2/features/auth/presentation/logic/auth_bloc/auth_state.dart';
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
    return BlocConsumer<AuthBloc,AuthState>(
       listener: (BuildContext context, AuthState state) { 
        if (state is LoginSucces) {
          
                 int count = 0;
          Navigator.popUntil(context, (route) {
            return count++ == 2;
          });
        }else if (state is LoginLoading) {
          showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Kcolors.blueBackground,
                  ),
                );
              });
        } else if (state is LoginFailure) {
          Navigator.pop(context);
          SnackBar failureSnack = SnackBar(
            content: Text(state.failure.errMessage),
            backgroundColor: Colors.red,
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(5),
          );
          ScaffoldMessenger.of(context).showSnackBar(failureSnack);
        }
        },
      builder: (context,state) {
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
                    UserModelLog userLog = UserModelLog(email:emailBloc.input,password: passwordBloc.input );
                      context.read<AuthBloc>().add(LoginEvent(userModelLog: userLog));
                      
                    
                  
                    
                  } 
                });
              },
              child: Text('Connecter',
                  style: Kcolors.fontMain
                      .copyWith(color: Colors.white, fontWeight: FontWeight.w900))),
        );
     
      },
    );
  }
}
