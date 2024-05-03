import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/utiles/snacks.dart';
import 'package:ser2/features/auth/presentation/logic/box_bloc.dart';
import 'package:ser2/features/auth/presentation/logic/box_state.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final BoxBloc emailBox = BoxBloc();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
       
      ),
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthBoxForget(
                size: size,
                hintText: 'Email',
                bloc: emailBox,
                errMessage: 'Entrer votre email',
                icon: Icons.email,
                isObscure: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.3,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(25)),
                child: TextButton(
                    onPressed: () async {
                      emailBox.validateEmail();

                      Future.delayed(const Duration(milliseconds: 100),
                          () async {
                        if (_formkey.currentState!.validate()) {
                          try {
                            await FirebaseAuth.instance.sendPasswordResetEmail(
                                email: emailBox.input.toString().trim());
                            ScaffoldMessenger.of(context)
                                .showSnackBar(emailSend);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(setErr);
                          }
                        }
                      });
                    },
                    child: Text('Reset',
                        style: Kcolors.fontMain.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w900))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AuthBoxForget extends StatelessWidget {
  const AuthBoxForget(
      {super.key,
      required this.size,
      required this.hintText,
      required this.bloc,
      required this.errMessage,
      required this.icon,
      required this.isObscure});
  final Size size;
  final String hintText;
  final String errMessage;
  final BoxBloc bloc;
  final IconData? icon;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoxBloc, BoxState>(
        bloc: bloc,
        builder: (context, state) {
          return Container(
            padding: Kpadding.authBoxPadding,
            width: size.width * 0.8,
            decoration: BoxDecoration(
                color: Kcolors.authBoxColor,
                borderRadius: Kredius.authBoxRadius),
            child: Center(
              child: TextFormField(
                obscureText: isObscure,
                onChanged: (val) => bloc.setInput(val),
                validator: (val) =>
                    (state is BoxValidateState) ? null : errMessage,
                style: Kcolors.fontMain.copyWith(color: Colors.black),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    suffixIconColor: Colors.black54,
                    focusColor: Colors.black54,
                    fillColor: Colors.black54,
                    border: InputBorder.none,
                    hintText: hintText,
                    suffixIcon: Icon(icon)),
              ),
            ),
          );
        });
  }
}
