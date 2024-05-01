import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/features/appointment/data/models/my_rendu_vous.dart';
import 'package:ser2/features/appointment/presentation/view/apt_doctor_profile.dart';

class RenduVousWidget extends StatelessWidget {
  const RenduVousWidget({
    super.key,
    required this.size,
    required this.renduVous,
  });

  final Size size;
  final RenduVousModel renduVous;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  DoctorAptProfile(docId: renduVous.doctorId,)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        height: size.height * 0.17,
        width: size.width * 0.95,
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
                  color: Kcolors.blueBackground,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  renduVous.turn.toString(),
                  style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.date_range),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "${renduVous.dateTime.day} ${DateFormat.MMMM().format(renduVous.dateTime)}",
                        style: Kcolors.fontMain.copyWith(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "${renduVous.dateTime.hour.toString().padLeft(2, '0')} : ${renduVous.dateTime.minute.toString().padLeft(2, '0')}",
                        style: Kcolors.fontMain.copyWith(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    height: 40,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Kcolors.blueBackground),
                    child: Center(
                      child: Text(
                        'More',
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
