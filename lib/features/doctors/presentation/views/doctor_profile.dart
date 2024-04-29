import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/doctors/data/models/doctor_Model.dart';
import 'package:ser2/features/doctors/presentation/widgets/book_apt.dart';
import 'package:ser2/features/doctors/presentation/widgets/phone_nbr.dart';


class DoctorProfile extends StatelessWidget {
  const DoctorProfile(
      {super.key, required this.nearbyDoctor, 


       
      });

 final DoctorModel nearbyDoctor;


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
                      "Dr ${nearbyDoctor.fullName}",
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                        "${nearbyDoctor.wilaya} - ${nearbyDoctor.wilaya}",
                        style:
                            Kcolors.fontMain.copyWith(color: Colors.black),
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
                            "Specialite : ",
                            style: Kcolors.fontMain.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            nearbyDoctor.speciality,
                            style: Kcolors.fontMain
                                .copyWith(color: Colors.black, fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Text(
                        'About',
                        style: Kcolors.fontMain.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                     Text(
                          nearbyDoctor.about)
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WorkingTime',
                        style: Kcolors.fontMain.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Text(
                        "Saturday ,Sunday 8:00 AM - 5:00 PM",
                        style: Kcolors.fontMain.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PhoneNbrButton(size: size, phoneNbr: nearbyDoctor.phoneNbr),
                      BookAptButton(size: size, doctor: nearbyDoctor,)
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


