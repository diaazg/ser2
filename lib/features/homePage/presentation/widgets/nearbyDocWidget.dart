import 'package:flutter/material.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/doctors/data/models/doctor_Model.dart';
import 'package:ser2/features/doctors/presentation/views/doctor_profile.dart';

class NearByDocWidget extends StatelessWidget {
  const NearByDocWidget({
    super.key,
    required this.size,
    required this.nearbyDoctor, required this.uid,
  });

  final Size size;
  final DoctorModel nearbyDoctor;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DoctorProfile(
                       nearbyDoctor: nearbyDoctor, uid: uid,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        height: size.height * 0.17,
        width: size.width * 0.90,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size.height * 0.15,
              width: size.width * 0.3,
              decoration: BoxDecoration(
                  color: nearbyDoctor.gender=='Female'?  const Color(0xFFF3C0C0): const Color(0xFF6694F6),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Image.asset(
                  nearbyDoctor.gender=='Female'? "images/appointement/7.png": "images/appointement/3.png",
                  height: size.height * 0.15,
                  width: size.width * 0.2,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dr-${nearbyDoctor.fullName} ",
                    style: Kcolors.fontMain.copyWith(
                        color: nearbyDoctor.gender=='Female'?  const Color(0xFFF3C0C0): const Color(0xFF6694F6),
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "Spécialité : ${nearbyDoctor.speciality} ",
                    style: Kcolors.fontMain.copyWith(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    height: 40,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: nearbyDoctor.gender=='Female'?  const Color(0xFFF3C0C0): const Color(0xFF6694F6)),
                    child: Center(
                      child: Text(
                        'Plus',
                        style: Kcolors.fontMain.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
