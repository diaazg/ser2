import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/widgets/error_widget.dart';
import 'package:ser2/core/widgets/loading_widget.dart';
import 'package:ser2/features/profile/presentation/logic/medicalHistory/medical_history_bloc.dart';
import 'package:ser2/features/profile/presentation/logic/medicalHistory/medical_history_state.dart';
import 'package:ser2/features/profile/presentation/widgets/history_type.dart';
import 'package:ser2/features/profile/presentation/widgets/illnes_card.dart';

class MedicalHistory extends StatelessWidget {
  const MedicalHistory({super.key, required this.bloc});

  final MedicalHistoryBloc bloc;

  


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFEAEBEC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      color: Colors.white,
                      child: const Center(child: Icon(Icons.navigate_before)),
                    ),
                  ),
                  Center(
                    child:  Text(
                          "Medical History",
                          style: Kcolors.fontMain.copyWith(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w900),
                        ),
                  )
                ],
              ),
            ),
            
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: size.height * 0.9,
              child: Column(
                children: [
                  Column(
                    children: [
                      const HistoryType(type: MedicalType.active),
                       SizedBox(
                        height: size.height * 0.8 * 0.2 * 0.1,
                      ),
                      SizedBox(
                        height: size.height * 0.8,
                        width: size.width,
                        child: BlocBuilder<MedicalHistoryBloc,MedicalHistoryState>(
                          bloc: bloc,
                          builder: (context,state) {
                           if(state is MedicalHistorySuccess){
                             return ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: state.medicalHistory.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return IllnessCard(
                                          pic :state.medicalHistory[index].type,
                                          size: size,
                                          periode: DateFormat('dd-MM-yyyy').format( state.medicalHistory[index].date.toDate()),
                                          illName: state.medicalHistory[index].illName,
                                        );
                                      
                                });
                           }else if(state is MedicalHistoryFailure){
                            return Center(child: ErrorCaseWidget(errMessage: state.failure.errMessage, height: 100, width: 100));
                           }else{
                            return const Center(child: LoadingWidget(size: 100));
                           }
                          }
                        ),
                      ),
                    
                   
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}





