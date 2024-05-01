import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/appointment/presentation/widget/error_widget.dart';

class DoctorAptProfile extends StatelessWidget {
  const DoctorAptProfile({super.key, required this.docId});
  final String docId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('doctors')
          .doc(docId)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const ErrorCaseWidget(errMessage: 'There is a problem');
        } else if (snapshot.hasData) {
           Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return SafeArea(
              child: Scaffold(
            backgroundColor: const Color(0xFFEAEBEC),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.65 * 0.5,
                    width: size.width,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Doctor profile",
                            style: Kcolors.fontMain.copyWith(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w800),
                          ),
                          Container(
                            height: size.height * 0.2,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                color: const Color(0xFF6694F6),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Image.asset(
                                "images/appointement/3.png",
                                height: size.height * 0.2,
                                width: size.width * 0.4,
                              ),
                            ),
                          ),
                          Text(
                            "Dr ${data['fullName']} ",
                            style: Kcolors.fontMain.copyWith(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    height: size.height * 0.65,
                    width: size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_pin,
                              color: Color(0xFF496CCE),
                            ),
                            Text(
                              "${data['Wilaya']} - ${data['Commune']} ",
                              style: Kcolors.fontMain
                                  .copyWith(color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.06,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Specialite :",
                                  style: Kcolors.fontMain.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  " ${data['Speciality']}",
                                  style: Kcolors.fontMain.copyWith(
                                      color: Colors.black, fontSize: 15),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            Text(
                              'About',
                              style: Kcolors.fontMain.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            Text(' ${data['about']}')
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.06,
                        ),
                       
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
        }else{
          return Center(
                        child: LoadingAnimationWidget.discreteCircle(
                      size: 200,
                      color: Colors.black,
                    ));
        }
      },
    );
  }
}
