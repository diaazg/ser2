import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/add_med_cubit.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/add_med_state.dart';

class DoseWidget extends StatelessWidget {
  const DoseWidget({
    super.key,
    required this.size,
    required this.title,
    required this.doseBloc,
    required this.doseNumber,
  });

  final Size size;
  final String title;
  final AddMedicineBloc doseBloc;
  final int doseNumber;

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
        BlocBuilder<AddMedicineBloc, AddMedicinState>(
          bloc: doseBloc,
          builder: (context, state) {
            return Container(
              height: size.height * 0.07,
              width: size.width * 0.25,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  height: size.height * 0.07,
                  width: size.width * 0.25,
                  child:  Center(child:doseBloc.checkDose(doseNumber) ?Text('${doseBloc.getDose(doseNumber)?.hour} : ${doseBloc.getDose(doseNumber)?.minute} '):const Text('Time'))),
            );
          },
        ),
      ],
    );
  }
}

class DoseSizeWidget extends StatelessWidget {
  const DoseSizeWidget({
    super.key,
    required this.size,
    required this.doseSize,
  });

  final Size size;
  final AddMedicineBloc doseSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "dose",
          style: Kcolors.fontMain.copyWith(color: Colors.black, fontSize: 15),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        BlocBuilder<AddMedicineBloc, AddMedicinState>(
          bloc: doseSize,
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              height: size.height * 0.07,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: TextFormField(
                  style: Kcolors.fontMain
                      .copyWith(color: Colors.black, fontSize: 20),
                  onChanged: doseSize.setInput,
                  validator: (val) =>
                      (state is UnValidateInputState) ? 'Enter dose' : null,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintStyle: Kcolors.fontMain
                          .copyWith(color: Colors.black, fontSize: 20),
                      border: InputBorder.none),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
