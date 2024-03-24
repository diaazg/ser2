


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/auth/presentation/logic/box_bloc.dart';
import 'package:ser2/features/auth/presentation/logic/box_state.dart';

class InfoBox extends StatelessWidget {

  const InfoBox({super.key, required this.size, required this.bloc, required this.errMessage, required this.hintText, required this.height, required this.width});
  final Size size ;
  final BoxBloc bloc ;
  final String errMessage ;
  final String hintText ;
  final double height ;
  final double width ;

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<BoxBloc,BoxState>(
      bloc: bloc,
      builder: (context,state) {
        return Container(
                        height: size.height *height ,
                        width: size.width * width ,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Center(
                            child: TextFormField(
                              style: Kcolors.fontMain
                                  .copyWith(color: Colors.black, fontSize: 20),
                              onChanged: (val) =>bloc.setInput(val),
                              validator: (val) =>
                                  (state is BoxValidateState) ? null : errMessage,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  hintStyle: Kcolors.fontMain
                                      .copyWith(color: Colors.black, fontSize: 20),
                                  hintText: hintText,
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      );
      }
    );
  }
}






