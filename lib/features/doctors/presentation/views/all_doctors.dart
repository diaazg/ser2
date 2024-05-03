import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/widgets/error_widget.dart';
import 'package:ser2/core/widgets/loading_widget.dart';
import 'package:ser2/features/doctors/data/models/doctor_Model.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsBloc.dart';
import 'package:ser2/features/doctors/presentation/logic/allDoctorsState.dart';
import 'package:ser2/features/doctors/presentation/widgets/search_widget.dart';
import 'package:ser2/features/doctors/presentation/widgets/speciality_box.dart';
import 'package:ser2/features/homePage/presentation/widgets/nearbyDocWidget.dart';

class AllDoctors extends StatelessWidget {
 AllDoctors({super.key, required this.bloc, required this.uid});


  final AllDoctorsBloc bloc;
  final String uid;
 
  List<DoctorModel> doctors = [];
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
             listener: (BuildContext context, AllDoctorsState state) { 
              if(state is DoctorSpecialSuccess){
               doctors = state.doctors;
              }
              },
            builder: (context, state) {
              return Column(
                children: [
                  SerarchWidget(size: size,bloc: bloc,doctors: doctors, uid: uid,),
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
                          return NearByDocWidget(nearbyDoctor: state.doctors[index], size: size, uid: uid,);
                        }),
                  );
                 
                   }else{
                    return const Center(child: Text('No doctor'),);
                   }
                  }else if(state is DoctorSpecialFailure){
                    return Center(child: ErrorCaseWidget(errMessage: state.failure.errMessage, height: 100, width: 100));
                  }else{
                     return const Center(child: LoadingWidget(size: 100));
                  }
                 })
                
                ],
              );
            },),
            
      ),
    ));
  }
}
