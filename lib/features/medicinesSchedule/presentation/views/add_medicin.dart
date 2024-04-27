import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/widgets/return_button.dart';
import 'package:ser2/features/medicinesSchedule/data/models/medicines_models.dart';
import 'package:ser2/features/medicinesSchedule/data/repo/medicines_repo_imp.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/add_med_cubit.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/add_med_state.dart';
import 'package:ser2/features/medicinesSchedule/presentation/widgets/add_medicine_day.dart';
import 'package:ser2/features/medicinesSchedule/presentation/widgets/dose.dart';
import 'package:ser2/features/medicinesSchedule/presentation/widgets/medicineDate.dart';
import 'package:ser2/features/medicinesSchedule/presentation/widgets/medicineName.dart';
import 'package:ser2/features/medicinesSchedule/presentation/widgets/medicineType.dart';

// ignore: must_be_immutable
class AddMedicin extends StatelessWidget {
  AddMedicin({super.key, required this.uid});

  final String uid;

  AddMedicineBloc medicineName = AddMedicineBloc();

  AddMedicineBloc typesBloc = AddMedicineBloc();

  AddMedicineBloc startDate = AddMedicineBloc();

  AddMedicineBloc endDate = AddMedicineBloc();

  AddMedicineBloc doseSize = AddMedicineBloc();

  AddMedicineBloc dose = AddMedicineBloc();
  final _formkey = GlobalKey<FormState>();

final AddMedicineBloc _addMedicineBloc = AddMedicineBloc();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFEAEBEC),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ReturnButton(),
              SizedBox(
                height: size.height * 0.04,
              ),
              Center(
                  child: Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MedicInputListWidget(
                            title: 'Medicine',
                            hintText: 'Enter your medicine',
                            size: size,
                            startDateBloc: medicineName,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          MedicinDate(
                              size: size,
                              title: 'Start',
                              hintText: 'Start date DD-MM-YYYY',
                              dateBloc: startDate,
                              isStart: true),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          MedicinDate(
                              size: size,
                              title: 'End',
                              hintText: 'End date DD-MM-YYYY',
                              dateBloc: endDate,
                              isStart: false),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DoseSizeWidget(
                                size: size,
                                doseSize: doseSize,
                              ),
                              TypesInput(size: size, typesBloc: typesBloc),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DoseWidget(
                                size: size,
                                title: 'dose 1',
                                doseBloc: dose,
                                doseNumber: 1,
                              ),
                              DoseWidget(
                                size: size,
                                title: 'dose 2',
                                doseBloc: dose,
                                doseNumber: 2,
                              ),
                              DoseWidget(
                                size: size,
                                title: 'dose 3',
                                doseBloc: dose,
                                doseNumber: 3,
                              ),
                            ],
                          ),
                        ],
                      ))),
              SizedBox(
                height: size.height * 0.02,
              ),
              BlocBuilder<AddMedicineBloc, AddMedicinState>(
                  bloc: _addMedicineBloc,
                  builder: (context, state) {
                    return Row(
                      children: [
                        AddMedicDay(
                          size: size,
                          isChoose: _addMedicineBloc.choosenDays['Sat']!,
                          day: 'Sat',
                          chooseDay: () => _addMedicineBloc.chooseDay('Sat'),
                        ),
                        AddMedicDay(
                          size: size,
                          isChoose: _addMedicineBloc.choosenDays['Sun']!,
                          day: 'Sun',
                          chooseDay: () => _addMedicineBloc.chooseDay('Sun'),
                        ),
                        AddMedicDay(
                          size: size,
                          isChoose: _addMedicineBloc.choosenDays['Mon']!,
                          day: 'Mon',
                          chooseDay: () => _addMedicineBloc.chooseDay('Mon'),
                        ),
                        AddMedicDay(
                          size: size,
                          isChoose: _addMedicineBloc.choosenDays['Thi']!,
                          day: 'Thi',
                          chooseDay: () => _addMedicineBloc.chooseDay('Thi'),
                        ),
                        AddMedicDay(
                          size: size,
                          isChoose: _addMedicineBloc.choosenDays['Wed']!,
                          day: 'Wed',
                          chooseDay: () => _addMedicineBloc.chooseDay('Wed'),
                        ),
                        AddMedicDay(
                          size: size,
                          isChoose: _addMedicineBloc.choosenDays['Tue']!,
                          day: 'Tue',
                          chooseDay: () => _addMedicineBloc.chooseDay('Tue'),
                        ),
                        AddMedicDay(
                          size: size,
                          isChoose: _addMedicineBloc.choosenDays['Fri']!,
                          day: 'Fri',
                          chooseDay: () => _addMedicineBloc.chooseDay('Fri'),
                        ),
                      ],
                    );
                  }),
              SizedBox(
                height: size.height * 0.02,
              ),
              AppoButton(
                  size: size,
                  title: 'save',
                  color: const Color(0xFF496CCE),
                  fontColor: Colors.white,
                  buttonFunc: () async {
                    medicineName.validateMedicine();
                    startDate.validateStartDate();
                    endDate.validateEndDate();
                    dose.validateDos();
                    doseSize.validateDoseQuantity();
                    typesBloc.validateType();
                    Future.delayed(const Duration(milliseconds: 100), () async {
                      List<String> choosenDays = [];
                      if (_formkey.currentState!.validate() &&
                          _addMedicineBloc.validateDay()) {
                        _addMedicineBloc.choosenDays.forEach((key, value) {
                          if (value) {
                            choosenDays.add(key);
                          }
                        });

                        MedicineRepoImp repo = MedicineRepoImp(uid: uid);
                        MedicineModel medicineModel = MedicineModel(
                            id: 'id',
                            medicineName: medicineName.input!,
                            startDate: DateFormat("dd-MM-yyyy")
                                .parseStrict(startDate.startDate!),
                            endDate: DateFormat("dd-MM-yyyy")
                                .parseStrict(endDate.endDate!),
                            days: choosenDays,
                            type: typesBloc.input!,
                            doseSize: 1.6,
                            doses: [dose.dose_1.toString(),dose.dose_2.toString()]);
                      var response =  await repo.addMedicine(medicineModel);
                     response.fold((l){
                                                const snackdemo = SnackBar(
                          content: Text('Something happened'),
                          backgroundColor: Colors.red,
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(5),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                     }, (r){
                                                                      const snackdemo = SnackBar(
                          content: Text('Medicine added succesfully'),
                          backgroundColor: Colors.green,
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(5),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                        _formkey.currentState!.reset();
                     });
                      } else if (_formkey.currentState!.validate()) {
                        const snackdemo = SnackBar(
                          content: Text('Choose days'),
                          backgroundColor: Colors.red,
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(5),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                      }
                    });
                  })
            ],
          ),
        ),
      ),
    ));
  }
}


