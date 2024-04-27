import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/schedule_cubit.dart';
import 'package:ser2/features/medicinesSchedule/presentation/logic/schedule_state.dart';
import 'package:ser2/features/medicinesSchedule/presentation/views/add_medicin.dart';
import 'package:ser2/features/medicinesSchedule/presentation/widgets/choosen_day.dart';
import 'package:ser2/localNotif.dart';


class MedicineSchedule extends StatelessWidget {
   MedicineSchedule({super.key});

  final ScheduleBloc _scheduleBloc = ScheduleBloc();

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
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            Center(
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFE5E8F2),
                                    borderRadius: BorderRadius.circular(300)),
                                child: const Center(
                                  child: CircleAvatar(
                                    radius: 100,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'hello',
                                  style: Kcolors.fontMain.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "User name",
                                  style: Kcolors.fontMain.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            )
                          ],
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

                               LocalNotifications.showNotification(
                                 title: 'first notification',
                                 body: 'hello user I\'m your daily medicines reminder '
                                );
                               /*   Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddMedicin()));  */
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
                  BlocBuilder<ScheduleBloc,ScheduleState>(
                    bloc: _scheduleBloc,
                    builder: (context,state) {
                      return Row(
                        children: [
                          DayChoosen(size: size, choosenDay:_scheduleBloc.choosenDay ,choose: (){
                            _scheduleBloc.chooseDay('Sat');
                          }, day: 'Sat',),
                           DayChoosen(size: size, choosenDay:_scheduleBloc.choosenDay ,choose: (){
                            _scheduleBloc.chooseDay('Sun');
                          }, day: 'Sun',),
                           DayChoosen(size: size, choosenDay:_scheduleBloc.choosenDay ,choose: (){
                            _scheduleBloc.chooseDay('Mon');
                          }, day: 'Mon',),
                           DayChoosen(size: size, choosenDay:_scheduleBloc.choosenDay ,choose: (){
                            _scheduleBloc.chooseDay('Thi');
                          }, day: 'Thi',),
                           DayChoosen(size: size, choosenDay:_scheduleBloc.choosenDay ,choose: (){
                            _scheduleBloc.chooseDay('Wed');
                          }, day: 'Wed',),
                           DayChoosen(size: size, choosenDay:_scheduleBloc.choosenDay ,choose: (){
                            _scheduleBloc.chooseDay('Tue');
                          }, day: 'Tue',),
                           DayChoosen(size: size, choosenDay:_scheduleBloc.choosenDay ,choose: (){
                            _scheduleBloc.chooseDay('Sat');
                          }, day: 'Fri',),
                        ],
                      );
                    }
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                 /*  SizedBox(
                    height: size.height * 0.3,
                    width: size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: homeController.userMed.length,
                        itemBuilder: (BuildContext context, int index) {
/*                         String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
                        DateTime dt1 = DateTime.parse("$currentDate 00:00:00");
                        DateTime dt2 = DateTime.parse("${homeController.userMed[index].fin} 00:00:00"); */

                          return ((dt1.isBefore(dt2) ||
                                      dt1.isAtSameMomentAs(dt2)) &&
                                  (homeController.userMed[index].medicinesDays
                                      .contains(days[chooseNbr - 1])))
                              ? medicineCard(
                                  size: size,
                                  name: homeController.userMed[index].name,
                                  time: homeController
                                      .userMed[index].medicinesTimes,
                                  dose: homeController.userMed[index].dose,
                                  type: homeController.userMed[index].type,
                                )
                              : null;
                        }),
                  ), */
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}


