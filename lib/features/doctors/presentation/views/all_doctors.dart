import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsBloc.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsState.dart';
import 'package:ser2/features/doctors/presentation/views/doctor_profile.dart';
import 'package:ser2/features/doctors/presentation/widgets/doctor_card.dart';
import 'package:ser2/features/doctors/presentation/widgets/search_widget.dart';
import 'package:ser2/features/doctors/presentation/widgets/speciality_box.dart';

class AllDoctors extends StatelessWidget {
  const AllDoctors({super.key, required this.allDoctorsBloc});

  final AllDoctorsBloc allDoctorsBloc;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFEAEBEC),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: BlocBuilder<AllDoctorsBloc, AllDoctorsState>(
            bloc: allDoctorsBloc,
            builder: (context, state) {
              return Column(
                children: [
                  SerarchWidget(size: size),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  SizedBox(
                    height: size.height * 0.09 * 0.75,
                    width: size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: allDoctorsBloc.special.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SpecialBox(
                            allDoctorsBloc: allDoctorsBloc,
                            size: size,
                            index: index,
                          );
                        }),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return DoctorCard(
                            size: size,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const DoctorProfile(
                                          docName: 'docName',
                                          id: 'id',
                                          specialite: 'specialite',
                                          wilaya: 'wilaya',
                                          commune: 'commune',
                                          phoneNbr: 'phoneNbr',
                                          lati: 222,
                                          long: 222)));
                            },
                          );
                        }),
                  )
                ],
              );
            }),
      ),
    ));
  }
}
