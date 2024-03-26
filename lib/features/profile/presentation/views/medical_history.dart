import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/profile/presentation/widgets/history_type.dart';
import 'package:ser2/features/profile/presentation/widgets/illnes_card.dart';

class MedicalHistory extends StatefulWidget {
  const MedicalHistory({super.key});

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  @override
  void initState() {
   
    super.initState();
    int i;
    for (i = 1; i < 8; i++) {}
  }

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
                        height: size.height * 0.3,
                        width: size.width,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return IllnessCard(
                                      size: size,
                                      pic: 4,
                                      periode: '2022/08/03',
                                      illName: 'Diabet',
                                    );
                                  
                            }),
                      ),
                      SizedBox(
                        height: size.height * 0.8 * 0.2 * 0.3,
                      ),
                    const HistoryType(type: MedicalType.archive),
                      SizedBox(
                        height: size.height * 0.8 * 0.2 * 0.1,
                      ),
                      SizedBox(
                        height: size.height * 0.3,
                        width: size.width,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return IllnessCard(
                                size: size,
                                pic: 1,
                                periode: '2024/09/25',
                                illName: 'Diabet 2',
                              );
                            }),
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





