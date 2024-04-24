import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsBloc.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsState.dart';
import 'package:ser2/features/doctors/presentation/views/doctor_profile.dart';
import 'package:ser2/features/doctors/presentation/widgets/doctor_card.dart';
import 'package:ser2/features/doctors/presentation/widgets/search_widget.dart';
import 'package:ser2/features/doctors/presentation/widgets/speciality_box.dart';
import 'package:ser2/features/homePage/presentation/widgets/nearbyDocWidget.dart';

class AllDoctors extends StatelessWidget {
  const AllDoctors({super.key, required this.bloc});


  final AllDoctorsBloc bloc;
 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFEAEBEC),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: BlocConsumer<AllDoctorsBloc, AllDoctorsState>(
            bloc:bloc ,
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
                        itemCount:     bloc.special.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SpecialBox(
                            bloc: bloc,
                            size: size,
                            index: index,
                          );
                        }),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                 Builder(builder: (context){
                  if(state is DoctorSpecialSuccess){
                   if(state.doctors.isNotEmpty){
                    return Expanded(
                    
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.doctors.length,
                        itemBuilder: (BuildContext context, int index) {
                          return NearByDocWidget(nearbyDoctor: state.doctors[index], size: size,);
                        }),
                  );
                 
                   }else{
                    return const Center(child: Text('No doctor'),);
                   }
                  }else if(state is DoctorSpecialFailure){
                    return Center(child: Text(state.failure.errMessage),);
                  }else{
                     return const Center(child: Text('wait ...'),);
                  }
                 })
                
                ],
              );
            }, listener: (BuildContext context, AllDoctorsState state) {  },),
            
      ),
    ));
  }
}
