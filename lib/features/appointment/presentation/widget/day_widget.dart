

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/appointment/presentation/logic/get_appointement/apointment_state.dart';
import 'package:ser2/features/appointment/presentation/logic/get_appointement/appointment_bloc.dart';

class DayChooseApt extends StatelessWidget {
  const DayChooseApt({
    super.key,
    required this.size, required this.bloc, this.onTap, required this.day,

  });

  final Size size;
  final AppointmentBloc bloc ;
  final Function()? onTap ;
  final Day day ;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      bloc: bloc,
      builder: (context,state) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            height: bloc.day == day ? size.height * 0.20 : size.height * 0.15,
            width: bloc.day == day ? size.width * 0.30 : size.width * 0.32,
            decoration: BoxDecoration(
                color: const Color(0xFFEAEBEC),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  day.name,
                  style: Kcolors.fontMain.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  day == Day.tomorrow ?"${DateTime.now().add(const Duration(days: 1)).day}":"${DateTime.now().day}" ,
                  style: Kcolors.fontMain.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  DateFormat('MMMM').format(DateTime.now()),
                  style: Kcolors.fontMain.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}

