import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/appointment/data/models/my_rendu_vous.dart';
import 'package:ser2/features/appointment/presentation/logic/my_appointements/my_apt_bloc.dart';
import 'package:ser2/features/appointment/presentation/logic/my_appointements/my_apt_state.dart';
import 'package:ser2/features/appointment/presentation/view/apt_doctor_profile.dart';
import 'package:ser2/features/appointment/presentation/widget/error_widget.dart';
import 'package:ser2/features/appointment/presentation/widget/header.dart';
import 'package:ser2/features/appointment/presentation/widget/rendu_vous_widget.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({super.key, required this.bloc});

  final MyAptBloc bloc;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFEAEBEC),
      body: Column(
        children: [
          Header(size: size),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocBuilder<MyAptBloc, MyAptState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state is MyAptSuccess) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.aptList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RenduVousWidget(
                            size: size,
                            renduVous: state.aptList[index],
                          );
                        });
                  } else if (state is MyAptFailure) {
                    return ErrorCaseWidget(errMessage: state.failure.errMessage);
                  } else {
                    return Center(
                        child: LoadingAnimationWidget.discreteCircle(
                      size: 200,
                      color: Colors.black,
                    ));
                  }
                },
                
              ),
            ),
          )
        ],
      ),
    ));
  }
}


