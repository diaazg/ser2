import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/widgets/error_widget.dart';
import 'package:ser2/core/widgets/loading_widget.dart';

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
          return const ErrorCaseWidget(errMessage: 'There is a problem', height: 100, width: 200,);
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
                                color: data['Gender']=='Female'?  const Color(0xFFF3C0C0): const Color(0xFF6694F6),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Image.asset(
                                data['Gender']=='Female'? "images/appointement/7.png": "images/appointement/3.png",
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
                             Icon(
                              Icons.location_pin,
                              color: data['Gender']=='Female'?  const Color(0xFFF3C0C0): const Color(0xFF6694F6),
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
                              'phone',
                              style: Kcolors.fontMain.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            Text(' ${data['phone']}')
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
          return const Center(child: LoadingWidget(size: 200));
        }
      },
    );
  }
}
