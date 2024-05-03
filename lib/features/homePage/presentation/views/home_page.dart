import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/widgets/error_widget.dart';
import 'package:ser2/core/widgets/loading_widget.dart';

import 'package:ser2/features/doctors/data/models/doctor_Model.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsBloc.dart';
import 'package:ser2/features/doctors/presentation/logic/doctorsEvent.dart';
import 'package:ser2/features/doctors/presentation/views/all_doctors.dart';
import 'package:ser2/features/homePage/presentation/logic/allDoctorsBloc.dart';
import 'package:ser2/features/homePage/presentation/logic/allDoctorsState.dart';
import 'package:ser2/features/homePage/presentation/logic/doctorsEvent.dart';
import 'package:ser2/features/homePage/presentation/widgets/nearbyDocWidget.dart';
import 'package:ser2/features/homePage/presentation/widgets/special_card.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_Event.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_bloc.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_state.dart';



class HomePage extends StatefulWidget {
HomePage({super.key, required this.userDataBloc});
  final UserDataBloc userDataBloc;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
      
  List<String?> doctors = [];

  List<String> special = ["Urology", "Neurology", "Ophtalmology", "Cardiology"];

  List<String> pic = ["urology", "brain", "eye", "cardiogram"];

  List<Color> colors = [Colors.teal, Colors.pink, Colors.cyan, Colors.yellow];

  List<DoctorModel> nearbyDoctors = [];
  @override
  void initState() {
    widget.userDataBloc.add(GetUserData(uid: widget.userDataBloc.uid));
    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SizedBox(
          height: size.height * 1.3,
          child: Column(
            children: [
             
              SizedBox(
                height: size.height * 0.2 * 0.4,
              ),
              Center(
                child: SizedBox(
                  width: 329 * fem,
                  height: 151 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // rectangle127WU5 (1:84)
                        left: 18 * fem,
                        top: 116 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 297 * fem,
                            height: 35 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                                color: const Color(0x7f20b8b8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle128NmB (1:85)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 329 * fem,
                            height: 145 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                                color: const Color(0xff20b8b8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // doctor5H7T (1:86)
                        left: 211 * fem,
                        top: 13 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 110 * fem,
                            height: 114 * fem,
                            child: Image.asset(
                              'assets/page-1/images/doctor-5.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // vector12yW5 (1:87)
                        left: 210 * fem,
                        top: 13 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 111 * fem,
                            height: 114 * fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-12.png',
                              width: 111 * fem,
                              height: 114 * fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // besmartbesaferpm (1:88)
                        left: 25 * fem,
                        top: 13 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 171 * fem,
                            height: 30 * fem,
                            child: DefaultTextStyle(
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5 * ffem / fem,
                                color: const Color(0xffffffff),
                              ),
                              child: const Text(
                                'Be smart be safe',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // line9H9P (1:89)
                        left: 23 * fem,
                        top: 51 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 152 * fem,
                            height: 1 * fem,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // covid19wearmasksaeH (1:90)
                        left: 29 * fem,
                        top: 55 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 124 * fem,
                            height: 60 * fem,
                            child: DefaultTextStyle(
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5 * ffem / fem,
                                color: const Color(0xffffffff),
                              ),
                              child: const Text(
                                'Covid-19\nwear masks',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1 * 0.2,
              ),
              GestureDetector(
                onTap: () {
                  /*                 Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AllSpecial())); */
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('see_all'),
                    SizedBox(
                      width: size.width * 0.1 * 0.1,
                    ),
                    Container(
                        height: 30,
                        width: 30,
                        decoration:
                            BoxDecoration(color: Kcolors.blueBackground),
                        child: const Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.1 * 0.2,
              ),
              SizedBox(
                height: size.height * 0.14,
                width: size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return SpecialCard(
                        size: size,
                        pic: pic[index],
                        name: special[index],
                        color: colors[index],
                      );
                    }),
              ),
              SizedBox(
                height: size.height * 0.1 * 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'nearby',
                    style: Kcolors.fontMain.copyWith(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      AllDoctorsBloc allDoctorsBloc = AllDoctorsBloc(
                          context.read<NearbyDoctorsBloc>().doctorsRepo);
                      allDoctorsBloc.add(SetSpeciality(special: "Urology"));
                      
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllDoctors(
                                
                                    bloc: allDoctorsBloc, uid: widget.userDataBloc.uid,
                                  )));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('viewMore'),
                        SizedBox(
                          width: size.width * 0.1 * 0.1,
                        ),
                        Container(
                            height: 30,
                            width: 30,
                            decoration:
                                BoxDecoration(color: Kcolors.blueBackground),
                            child: const Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.1 * 0.2,
              ),
              BlocConsumer<UserDataBloc, UserDataState>(
                  bloc: widget.userDataBloc,
                  builder: (context, state1) {
                    if (state1 is UserDataGetSuccessfull) {
                      return BlocConsumer<NearbyDoctorsBloc,
                          NearbyDoctorsState>(
                        listener:
                            (BuildContext context, NearbyDoctorsState state) {
                          if (state is DoctorNearbySuccess) {
                            nearbyDoctors = state.doctors;
                            
                          }
                        },
                        builder: (context, state) {
                          if (state is DoctorNearbySuccess) {
                            return Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: nearbyDoctors.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return NearByDocWidget(
                                        size: size,
                                        nearbyDoctor: nearbyDoctors[index], uid: state1.userModelInfo.uid!,);
                                  }),
                            );
                          } else if (state is DoctorNearbyFailure) {
                            return Center(child: ErrorCaseWidget(errMessage: state.failure.errMessage, height: 100, width: 100));
                          } else {
                            return const Center(child:  LoadingWidget(size: 100));
                          }
                        },
                      );
                    } else if (state1 is UserDataGetFailure) {
                      return Center(child: ErrorCaseWidget(errMessage: state1.failure.errMessage, height: 100, width: 100));
                    } else {
                      return  const Center(child: LoadingWidget(size: 100));
                    }
                  },
                  listener: (BuildContext context, UserDataState state1) {
                    if (state1 is UserDataGetSuccessfull) {
                      
                     context.read<NearbyDoctorsBloc>().add(
                          GetNearbyDoctorsEvent(
                              wilaya: state1.userModelInfo.city));
                    }
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
