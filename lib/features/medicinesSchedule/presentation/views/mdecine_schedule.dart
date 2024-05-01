import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/widgets/error_widget.dart';
import 'package:ser2/core/widgets/loading_widget.dart';
import 'package:ser2/features/medicinesSchedule/data/repo/medicines_repo_imp.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/schedule_cubit.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/schedule_state.dart';
import 'package:ser2/features/medicinesSchedule/presentation/views/add_medicin.dart';
import 'package:ser2/features/medicinesSchedule/presentation/widgets/choosen_day.dart';
import 'package:ser2/features/medicinesSchedule/presentation/widgets/medcin_card.dart';
import 'package:ser2/features/profile/presentation/logic/userData/user_data_bloc.dart';

class MedicineSchedule extends StatefulWidget {
  const MedicineSchedule({super.key, required this.userDataBloc});

  final UserDataBloc userDataBloc;

  @override
  State<MedicineSchedule> createState() => _MedicineScheduleState();
}

class _MedicineScheduleState extends State<MedicineSchedule> {
  late ScheduleBloc _scheduleBloc;

  @override
  void initState() {
    String uid = widget.userDataBloc.uid;
    MedicineRepoImp repo = MedicineRepoImp(uid: uid);
    _scheduleBloc = ScheduleBloc(repo);
       
    _scheduleBloc.chooseDay(DateFormat.EEEE().format(DateTime.now()).toString().substring(0,3));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFF6694F6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.4,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "create new",
                              style: Kcolors.fontMain.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            GestureDetector(
                              onTap: () {
/*                                 LocalNotifications.showScheduleNotifications(
                                    title: 'first notification',
                                    body:
                                        'hello user I\'m your daily medicines reminder ',
                                    scheduleDate: DateTime.now()
                                        .add(const Duration(seconds: 10))); */
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddMedicin(
                                              uid: widget.userDataBloc.uid,
                                            )));
                              },
                              child: Container(
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    'New',
                                    style: Kcolors.fontMain.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      "images/appointement/8.png",
                      height: 150,
                      width: 150,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.6,
              width: size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                children: [
                  BlocBuilder<ScheduleBloc, ScheduleState>(
                      bloc: _scheduleBloc,
                      builder: (context, state) {
                        return Row(
                          children: [
                            DayChoosen(
                              size: size,
                              choosenDay: _scheduleBloc.choosenDay,
                              choose: () {
                                _scheduleBloc.chooseDay('Sat');
                              },
                              day: 'Sat',
                            ),
                            DayChoosen(
                              size: size,
                              choosenDay: _scheduleBloc.choosenDay,
                              choose: () {
                                _scheduleBloc.chooseDay('Sun');
                              },
                              day: 'Sun',
                            ),
                            DayChoosen(
                              size: size,
                              choosenDay: _scheduleBloc.choosenDay,
                              choose: () {
                                _scheduleBloc.chooseDay('Mon');
                              },
                              day: 'Mon',
                            ),
                            DayChoosen(
                              size: size,
                              choosenDay: _scheduleBloc.choosenDay,
                              choose: () {
                                _scheduleBloc.chooseDay('Tue');
                              },
                              day: 'Tue',
                            ),
                            DayChoosen(
                              size: size,
                              choosenDay: _scheduleBloc.choosenDay,
                              choose: () {
                                _scheduleBloc.chooseDay('Wed');
                              },
                              day: 'Wed',
                            ),
                            DayChoosen(
                              size: size,
                              choosenDay: _scheduleBloc.choosenDay,
                              choose: () {
                                _scheduleBloc.chooseDay('Thu');
                              },
                              day: 'Thu',
                            ),
                            DayChoosen(
                              size: size,
                              choosenDay: _scheduleBloc.choosenDay,
                              choose: () {
                                _scheduleBloc.chooseDay('Fri');
                              },
                              day: 'Fri',
                            ),
                          ],
                        );
                      }),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Expanded(
                    child: BlocBuilder<ScheduleBloc, ScheduleState>(
                        bloc: _scheduleBloc,
                        builder: (context, state) {
                          if (state is ScheduleSuccessState) {
                            return ListView.builder(
                                itemCount: state.medicinesList.length,
                                itemBuilder: (context, index) {
                                  return MedicineCard(
                                      size: size,
                                      name:
                                          state.medicinesList[index].medicineName,
                                      time: state.medicinesList[index].doses,
                                      dose: state.medicinesList[index].doseSize
                                          .toString(),
                                      type: state.medicinesList[index].type);
                                });
                          } else if (state is ScheduleFailureState) {
                            return ErrorCaseWidget(
                                errMessage: state.failure.errMessage, height: 100, width: 100);
                          } else {
                            return const LoadingWidget(size: 100);
                          }
                        }),
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

