import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/add_med_cubit.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/add_med_state.dart';

class MedicinDate extends StatelessWidget {
  const MedicinDate({super.key, required this.size, required this.title, required this.hintText, required this.dateBloc, required this.isStart});
  final Size size ;
  final String title ;
  final String hintText;
  final AddMedicineBloc dateBloc ;
  final bool isStart ;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Kcolors.fontMain.copyWith(color: Colors.black, fontSize: 15),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        BlocBuilder<AddMedicineBloc,AddMedicinState>(
          bloc:dateBloc ,
          builder: (context,state){
          return Container(
          height: size.height * 0.07,
          width: size.width * 0.9,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Center(
              child: TextFormField(
                keyboardType: TextInputType.datetime,
                style: Kcolors.fontMain
                    .copyWith(color: Colors.black, fontSize: 20),
                onChanged:isStart ? dateBloc.setStartDate:dateBloc.setFinDate ,
                validator: (val) => (state is UnValidateInputState)
                    ? 'check date'
                    : null,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintStyle: Kcolors.fontMain
                        .copyWith(color: Colors.black, fontSize: 20),
                    hintText:hintText,
                    border: InputBorder.none),
              ),
            ),
          ),
        );
      
        })
        
        ],
    );
  }
}
