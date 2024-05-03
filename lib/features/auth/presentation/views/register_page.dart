import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ser2/features/auth/presentation/widget/auth_boxes.dart';
import 'package:ser2/features/auth/presentation/logic/box_bloc.dart';
import 'package:ser2/features/auth/presentation/widget/register_button.dart';
import '../../../../core/utiles/constants.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _formkey = GlobalKey<FormState>();

  final BoxBloc userNameBloc = BoxBloc();

  final BoxBloc emailBloc = BoxBloc();

  final BoxBloc passwordBloc = BoxBloc();

  final BoxBloc checkPasswordBloc = BoxBloc();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Kcolors.blueBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.2,
              width: size.width,
              child: Center(
                child: Text(
                  "Be part of sa7ti ",
                  style:
                      GoogleFonts.pacifico(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
            Container(
              height: size.height * 0.85,
              width: size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Center(
                      child: Image.asset("images/logIn/1blue.png"),
                    ),
                  ),
                  Form(
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          AuthBox(
                            size: size,
                            hintText: 'User name',
                            bloc: userNameBloc,
                            errMessage: 'Enter user name',
                            icon: Icons.person_2_outlined,
                            isObscure: false,
                          ),
                          SizedBox(height: size.height * 0.8 * 0.01),
                          AuthBox(
                            size: size,
                            hintText: 'Email',
                            bloc: emailBloc,
                            errMessage: 'Enter an email',
                            icon: Icons.email,
                            isObscure: false,
                          ),
                          SizedBox(height: size.height * 0.8 * 0.01),
                          AuthBox(
                            size: size,
                            hintText: 'Password',
                            bloc: passwordBloc,
                            errMessage: 'Enter password',
                            icon: Icons.password,
                            isObscure: true,
                          ),
                          SizedBox(height: size.height * 0.8 * 0.01),
                          AuthBox(
                              size: size,
                              hintText: 'validate password',
                              bloc: checkPasswordBloc,
                              errMessage: 'Enter validate password', icon: Icons.password, isObscure: true,),
                          SizedBox(height: size.height * 0.8 * 0.08),
                          RegisterButton(
                              size: size,
                              emailBloc: emailBloc,
                              passwordBloc: passwordBloc,
                              formkey: _formkey,
                              usernameBloc: userNameBloc,
                              checkPassword: checkPasswordBloc)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
