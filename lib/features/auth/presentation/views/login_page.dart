import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/auth/presentation/views/register_page.dart';
import 'package:ser2/features/auth/presentation/widget/auth_boxes.dart';
import 'package:ser2/features/auth/presentation/widget/loginButton.dart';
import 'package:ser2/features/auth/presentation/logic/box_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey = GlobalKey<FormState>();

  final BoxBloc emailBox = BoxBloc();
  final BoxBloc passwordBox = BoxBloc();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
                  'welcome',
                  style:
                      GoogleFonts.pacifico(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
            Container(
              height: size.height * 0.8,
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
                          SizedBox(height: size.height * 0.8 * 0.1),
                          AuthBox(
                            size: size,
                            hintText: 'Email',
                            bloc: emailBox,
                            errMessage: 'Enter your email',
                            icon: Icons.email,
                            isObscure: false,
                          ),
                          SizedBox(height: size.height * 0.8 * 0.1),
                          AuthBox(
                            size: size,
                            hintText: 'Password',
                            bloc: passwordBox,
                            errMessage: 'Enter your password',
                            icon: Icons.password,
                            isObscure: true,
                          ),
                          SizedBox(height: size.height * 0.8 * 0.01),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                             
                                Text(
                                  "Forget password? ",
                                  style: Kcolors.fontMain.copyWith(
                                      color: Colors.redAccent, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.8 * 0.08),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  width: size.width * 0.35,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF6694F6),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: TextButton(
                                      onPressed: () async {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegisterPage()));
                                      },
                                      child: Text('sign up',
                                          style: Kcolors.fontMain.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900))),
                                ),
                                LoginButton(
                                  size: size,
                                  formkey: _formkey,
                                  emailBloc: emailBox,
                                  passwordBloc: passwordBox,
                                )
                              ],
                            ),
                          )
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
