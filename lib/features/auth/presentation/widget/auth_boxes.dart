import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/auth/presentation/logic/box_bloc.dart';
import 'package:ser2/features/auth/presentation/logic/box_state.dart';

class AuthBox extends StatelessWidget {
  const AuthBox(
      {super.key,
      required this.size,
      required this.hintText,
      required this.bloc,
      required this.errMessage,
      required this.icon, required this.isObscure});
  final Size size;
  final String hintText;
  final String errMessage;
  final BoxBloc bloc;
  final IconData? icon;
  final bool isObscure ;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoxBloc, BoxState>(
        bloc: bloc,
        builder: (context, state) {
          return Container(
            padding: Kpadding.authBoxPadding,
            width: size.width * 0.9,
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
                    suffixIcon:  Icon(icon)),
              ),
            ),
          );
        });
  }
}
