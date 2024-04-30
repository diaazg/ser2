import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/appointment/presentation/logic/apointment_state.dart';
import 'package:ser2/features/appointment/presentation/logic/appointment_bloc.dart';
import 'package:ser2/features/appointment/presentation/widget/day_widget.dart';
import 'package:ser2/features/doctors/data/models/doctor_Model.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage(
      {super.key, required this.bloc, required this.doctorModel, required this.uid});

  final AppointmentBloc bloc;
  final DoctorModel doctorModel;
  final String uid ;

  @override
  Widget build(BuildContext context) {
   
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppointmentBloc, AppointmentState>(
      listener: (BuildContext context, AppointmentState state) { 
        if(state is ReserveSuccess){

        }else if(state is ReserveFailure){

        }
        },
        bloc: bloc,
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            backgroundColor: const Color(0xFFEAEBEC),
            body: Column(
              children: [
                Container(
                  height: size.height * 0.58,
                  width: size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BackButton(),
                      SizedBox(
                        height: size.height * 0.65 * 0.5,
                        width: size.width,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'appointment',
                                style: Kcolors.fontMain.copyWith(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800),
                              ),
                              Container(
                                height: size.height * 0.2,
                                width: size.width * 0.4,
                                decoration: BoxDecoration(
                                    color: Kcolors.blueBackground,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Image.asset(
                                    "images/appointement/3.png",
                                    height: size.height * 0.2,
                                    width: size.width * 0.4,
                                  ),
                                ),
                              ),
                              Text(
                                "Dr ${doctorModel.fullName}",
                                style: Kcolors.fontMain.copyWith(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                doctorModel.speciality,
                                style: Kcolors.fontMain.copyWith(
                                    color: Colors.black54, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_pin,
                                color: Color(0xFF6694F6),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${doctorModel.wilaya} - ${doctorModel.commune} ",
                                style: Kcolors.fontMain.copyWith(
                                    color: Colors.black54, fontSize: 20),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.timer,
                                color: Color(0xFF6694F6),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                (state is AppointmentStateSucces)
                                    ? 'count down : ${bloc.countDown}'
                                    : 'count down : _',
                                style: Kcolors.fontMain.copyWith(
                                    color: Colors.black54, fontSize: 20),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      )),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          height: size.height * 0.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DayChooseApt(
                                size: size,
                                bloc: bloc,
                                day: Day.today,
                                onTap: () {
                                  bloc.setToday();
                                },
                              ),
                              DayChooseApt(
                                size: size,
                                bloc: bloc,
                                day: Day.tomorrow,
                                onTap: () {
                                  bloc.setTomorrow();
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: AppoButton(
                          size: size,
                          color: Kcolors.blueBackground,
                          title: 'confirm',
                          buttonFunc: () {
                         

                            bloc.reserveApt(uid);
                          },
                          fontColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ));
        }, );
  }
}
