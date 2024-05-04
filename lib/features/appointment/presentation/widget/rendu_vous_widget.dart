import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ser2/core/utiles/constants.dart';
import 'package:ser2/core/utiles/snacks.dart';
import 'package:ser2/features/appointment/data/models/my_rendu_vous.dart';
import 'package:ser2/features/appointment/presentation/logic/my_appointements/my_apt_bloc.dart';
import 'package:ser2/features/appointment/presentation/view/apt_doctor_profile.dart';

class RenduVousWidget extends StatelessWidget {
  const RenduVousWidget({
    super.key,
    required this.size,
    required this.renduVous, required this.bloc,
  });

  final Size size;
  final RenduVousModel renduVous;
  final MyAptBloc bloc;

  bool isRed(DateTime date) {
    if (DateTime.now().isAfter(date)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
         if(isRed(renduVous.dateTime)){
                  DocumentReference documentReference = FirebaseFirestore.instance
            .collection('Reservation')
            .doc(renduVous.renduVousId);

        try {
          
          await documentReference.delete();
           ScaffoldMessenger.of(context)
                                  .showSnackBar(deleteAptSuccess);
          bloc.getMyApt();
          
        } catch (e) {
          ScaffoldMessenger.of(context)
                                  .showSnackBar(setErr);
        }
         }
      },
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DoctorAptProfile(
                      docId: renduVous.doctorId,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        height: size.height * 0.17,
        width: size.width * 0.9,
        decoration: BoxDecoration(
            border: isRed(renduVous.dateTime)
                ? Border.all(
                    width: 1,
                    color: Colors.red,
                  )
                : null,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
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
                      fontSize: 40,
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
